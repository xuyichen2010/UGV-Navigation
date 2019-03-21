#include "utm_laser/UtmLaser.h"
#include <stdexcept>
#include "ros/ros.h"
#include <vector>
#include "sensor_msgs/LaserScan.h"  
#include "utm_laser/Laser.h"
#include "utm_laser/Calibration.h"

#include <laser_geometry/laser_geometry.h>
#include <sensor_msgs/PointCloud2.h>
#include <sensor_msgs/point_cloud2_iterator.h>

#include <visualization_msgs/MarkerArray.h>


using namespace hokuyo;

UtmLaser::UtmLaser(       
	ros::NodeHandle nh, 
        ros::NodeHandle private_nh) :
    nh_(nh),
    private_nh_(private_nh)
{
    readLaser = nh_.subscribe("scan", 20, &UtmLaser::laserCallback, this);
    pushTargetCoords = nh_.advertise<utm_laser::Laser>("target_xy", 20);
    calibrationTest = nh_.advertise<utm_laser::Calibration>("intensity_exp", 10);
    thresholdPoints = nh_.advertise<sensor_msgs::PointCloud2>("selected_points", 10);
    intensityFilter = nh_.advertise<visualization_msgs::MarkerArray>(std::string("/intensity_marker_viz"), 1);
    lastTime = ros::Time::now().toSec();

    	private_nh_.param("loop_rate", loop_rate_, 20.0);
    	private_nh_.param("percentage_threshold", PERCENTAGE_THRESHOLD, 0.80);
    	//target would need to move more than 22mph to break this. Based on 20Hz sensor rate.
	private_nh_.param("target_max_change", TARGET_MAX_CHANGE, 0.50);
	private_nh_.param("min_detection_width", MIN_DETECTION_WIDTH, 0.01);//meters. 
	private_nh_.param("max_detection_width", MAX_DETECTION_WIDTH, 0.05);//meters. 
	
	//safety lock for tracking one target
	last_sensor_target_x = 0.;
	last_sensor_target_y = 0.;
	newTarget = true;
}

//Process per scan information 
void UtmLaser::laserCallback(const sensor_msgs::LaserScan::ConstPtr& msg){

	visualization_msgs::MarkerArray laser_markers;
	const double LINEAR_CONST_A = 4128.6;
	const double LINEAR_CONST_B = 12576.4;
	const double QUAD_CONST_A = -49.7;
	const double QUAD_CONST_B = -178.6;
	const double QUAD_CONST_C = 14993.4;
	//These are calculated from intersection of two lines
	const double NORM_MAX_RANGE = 0.56;
	const double NORM_MAX_INTENSITY = 14878;
	//Variable percentage from max of normalizing
	const double INTENSITY_THRESHOLD = PERCENTAGE_THRESHOLD * NORM_MAX_INTENSITY;
	const int POINT_RANGE = ( msg->angle_max - msg->angle_min ) 
		/ msg->angle_increment;

	std::vector<double> high_intensity_idxs;
	std::vector<double> high_intensity_ranges;
	std::vector<int>::const_iterator it;
	//Points indexed increasingly CCW
	for(int index = 0; index < POINT_RANGE+1; index++){
		
		//create marker for visualizing
		visualization_msgs::Marker new_marker;
        	new_marker.header.frame_id = msg->header.frame_id;
        	new_marker.header.stamp = ros::Time::now();
        	new_marker.id = index;
        	new_marker.ns = "laser_markers";
        	new_marker.type = visualization_msgs::Marker::CYLINDER;
        	new_marker.action = visualization_msgs::Marker::ADD;
		//get x and y coordinates
		double theta = lerp(0, POINT_RANGE, index, msg->angle_min, msg->angle_max);
		UtmLaser::Rectangular_Coords temp;
		temp = polarToRectangular(msg->ranges[index], theta);
        	//Northing and Easting needs to be fixed
		new_marker.pose.position.x = temp.Northing;
        	new_marker.pose.position.y = temp.Easting;
        	new_marker.pose.position.z = 0.0;
        	new_marker.scale.z = 0.1;
        	new_marker.lifetime = ros::Duration(1);        
		new_marker.color.a = 1.0;

		double NORMALIZED_INTENSITY;
		const double range = msg->ranges[index];
		const double intensity = msg->intensities[index];	
		if(range < NORM_MAX_RANGE){
			//normalize linearly
			NORMALIZED_INTENSITY = ( NORM_MAX_INTENSITY / ( LINEAR_CONST_A*range + LINEAR_CONST_B )) * intensity; 
		}
		else{
			//normalize from quadratic
			NORMALIZED_INTENSITY = ( NORM_MAX_INTENSITY / ( QUAD_CONST_A*range*range + QUAD_CONST_B*range + QUAD_CONST_C )) * intensity; 
		}
		if(NORMALIZED_INTENSITY > INTENSITY_THRESHOLD){
			//save to new array if passes threshold
			high_intensity_idxs.push_back(index);
			high_intensity_ranges.push_back(range);
			//color point red and larger scale
			new_marker.color.r = 1.0;
        		new_marker.color.g = 0.0;
	        	new_marker.color.b = 0.0;
	        	new_marker.scale.x = 0.1;
        		new_marker.scale.y = 0.1;
		}
		else{
			//color point blue and smaller scale
			new_marker.color.r = 0.0;
        		new_marker.color.g = 0.0;
	        	new_marker.color.b = 1.0;
	        	new_marker.scale.x = 0.05;
	        	new_marker.scale.y = 0.05;
		}
		//add marker to the array
		const int MULTIPLE_DROP_BY = 1;
		if(index % MULTIPLE_DROP_BY == 0){	//rviz was running slow so drop data
        	   laser_markers.markers.push_back(new_marker);		
		}
	}

	
	//find median of theta 
	double median = calcMedian(high_intensity_idxs); 
	double theta = lerp(0, POINT_RANGE, median, msg->angle_min, msg->angle_max);
	double radius = calcMedian(high_intensity_ranges);

	UtmLaser::Rectangular_Coords target_coords;
	target_coords = polarToRectangular(radius, theta);	
	//Arc estimate width of target.
        
	double width = high_intensity_ranges.size() / (double)POINT_RANGE * radius;
	//Change in distance from last measurement
	double delta_distance = distance(last_sensor_target_y, last_sensor_target_x, target_coords.Northing, target_coords.Easting);
	ROS_INFO("delta distance= %f\n", delta_distance);		 
	//seems to work but X and Y flipped ?? /////******//////****
 	//set placeholders for last target coordinates
	last_sensor_target_x = target_coords.Easting;
	last_sensor_target_y = target_coords.Northing;
    newTarget = false;
    
	if(width < MIN_DETECTION_WIDTH || width > MAX_DETECTION_WIDTH){
		target_coords.Northing = 0.;
		target_coords.Easting = 0.;
		newTarget = true;
	}
	if(!newTarget && delta_distance > TARGET_MAX_CHANGE){
		target_coords.Northing = 0.;
		target_coords.Easting = 0.;
		newTarget = true;		
	} 
		
	//set member targets for advertising topic ///////////
	Northing = target_coords.Northing;
	Easting = target_coords.Easting;
	//set experimental data /////////
	med_range = msg->ranges[median];
	med_intensity = msg->intensities[median];

	//publish intensity visualization
	intensityFilter.publish(laser_markers);

	return;	
}

utm_laser::Laser UtmLaser::getTargetCoords(){
	boost::mutex::scoped_lock lock(lock_);
	utm_laser::Laser laser;
	laser.header.stamp = ros::Time::now();
    //this is flipped needs to be fixed TODOOOOOO ////////////////
	laser.Target_Northing = Easting;
	laser.Target_Easting = Northing;
	return laser;
}

utm_laser::Calibration UtmLaser::getExpData(){
	boost::mutex::scoped_lock lock(lock_);
	utm_laser::Calibration exp;
	exp.header.stamp = ros::Time::now();
	exp.range = med_range;
	exp.intensity = med_intensity;
	return exp;
}


UtmLaser::Rectangular_Coords UtmLaser::polarToRectangular(double radius, double theta){
	if(radius < 0){
		throw std::exception();	
	}
	double x;
	double y;

	x = radius * cos(theta);
	y = -1*radius * sin(theta);  //x and y reversed //////****////

	UtmLaser::Rectangular_Coords converted;
	converted.Northing = y;
	converted.Easting = x;
	return converted;
}

double UtmLaser::calcMedian(std::vector<double> scores){
  size_t size = scores.size();

  if (size == 0)
  {
    return 0;  // Undefined, really.
  }
  else if (size == 1)
  {
    return scores[0];
  }
  else
  {
    sort(scores.begin(), scores.end());
    if (size % 2 == 0)
    {
      return (scores[size / 2 - 1] + scores[size / 2]) / 2;
    }
    else 
    {
      return scores[size / 2];
    }
  }
}

//Euclidean distance function takes in two points in the cartesian plane, returns the distance 
double UtmLaser::distance(double x1, double y1, double x2, double y2){
    double diff1 = pow( (x1 - x2) , 2);
    double diff2 = pow( (y1 - y2) , 2);
    
    double dist = sqrt( diff1 + diff2 );

    return dist;
}



/*Function to linearly interpolate: takes in a range (start1 - end1) and a value in that range (x) and then finds the equivalent value in the range start2 - end2. This can be used to linearly interpolate in our lookup table */
double UtmLaser::lerp(double start1, double end1, double x, double start2, double end2){

    double lerpVal = 0.0;
    double diff1;
    double xDiff;
    double percent;
    double diff2;

    diff1 = end1 - start1;
    xDiff = x - start1;
    percent = xDiff / diff1;

    diff2 = end2 - start2;
    
    lerpVal = start2 + (percent * diff2);

    return lerpVal;

}


void UtmLaser::run() {
	bool laser_topic_check = false;
	ros::master::V_TopicInfo master_topics;
	ros::master::getTopics(master_topics);
	//check to make sure laser is publishing
	for (ros::master::V_TopicInfo::iterator it = master_topics.begin() ; it != master_topics.end(); it++) {
  	const ros::master::TopicInfo& info = *it;
  	std::cout << "topic_" << it - master_topics.begin() << ": " << info.name << std::endl;
		if(info.name == "/scan"){
			laser_topic_check = true;
			break;
		}
	}
	//quit if topic is not available
	if(!laser_topic_check){
		ROS_INFO("%s\n", "Laser topic is not available. Shutting down.");
		ros::shutdown();
	}
	

    double dt;
    ros::Rate loop_rate(loop_rate_);
    while (ros::ok()){
  	dt = 1 / loop_rate_;
        //std::cout << "Object Relative X Position: " << Easting << std::endl;
        //std::cout << "Object Relative Y Position: " << Northing << std::endl << std::endl;
        utm_laser::Laser laser = getTargetCoords();
	utm_laser::Calibration exp = getExpData();
	pushTargetCoords.publish(laser);
	calibrationTest.publish(exp);
        ros::spinOnce();
        loop_rate.sleep();
    }
}


int main(int argc, char** argv) {
    ros::init(argc, argv, "utm_laser");
    ros::NodeHandle nh;
    ros::NodeHandle private_nh("~");

    try {
        UtmLaser ul(nh, private_nh);
        ul.run();
    }
    catch(std::runtime_error ex) {
        ROS_ERROR("%s", ex.what());
        return -1;
    }

    return 0;
}


