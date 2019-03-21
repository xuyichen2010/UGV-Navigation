#include "ros/ros.h"
#include <tf/transform_broadcaster.h>

#include "maestro/VelAndAngle.h"
#include "nav_msgs/Odometry.h"
#include "std_msgs/String.h"
#include "geometry_msgs/Twist.h"

#include <geodesy/utm.h>
#include <cmath>
#include <fstream>
#include <string>
#include <vector>
#include <iostream>
#include <string.h>
#include <iterator>
#include <sstream>
#include <stdlib.h>
#include <math.h>
#include <limits.h>
#include <stdexcept>

#include <visualization_msgs/MarkerArray.h>

using namespace std;

struct Point {
    double easting;
    double northing;
};

class GPSWaypointFollowingNode {
    public:
        GPSWaypointFollowingNode(ros::NodeHandle, ros::NodeHandle);
        void odometryCallback(const nav_msgs::Odometry::ConstPtr&);
        void startCallback(const std_msgs::String::ConstPtr&);
        double boundAngle(double ang);
        void run();

    private:
        ros::NodeHandle nh_;
        ros::NodeHandle private_nh_;
        ros::Subscriber readOdometry;
        ros::Subscriber readStart;
        ros::Publisher pushControl;
        ros::Publisher cmd_vel_pub_;
        ros::Publisher waypoint_viz_pub_;
        ros::Publisher endpoint_viz_pub_;

        void publishWaypoints();
        void publishEndpoints();
        std::string odom_frame_;
        std::vector<Point> whiskers_;
        Point best_point_;

        //lock for the position data
        boost::mutex position_lock_;
        
        //current position elements
        double xCurr;
        double yCurr;
        double thetaCurr;

        bool canStart; //can we start planning yet or not
        
        int waypointCurr; //index of current waypoint in the waypoint vectors
        bool pathFinished;

        bool haveValidOdom; //keep track of when we have odometry we can plan from

        //parameters
        double tolerance_; //how far from the current waypoint must we be to be considered at the waypoint
        double velocity_; //constant velocity to command while doing waypoint following
        double timeHorizon_; //time horizon, our dt and how far we will project our samples
        int stepSize_;
        string waypointFilename_; //name of our waypoint file
        double loop_rate_;
        double thetaRange_; //range of possible angular velocities to command (ranges from negative thetaRange to psitive thetaRange)
        double thetaResolution_; //how finely we chop up the thetaRange when sampling
        double skipDistance_; //how far away we must be before deciding to skip a waypoint

        double distance(double x1, double y1, double x2, double y2);
        bool atWaypoint(double x, double y);
        double sampleAndProjectControls();
	void createGPSWaypoints(double lat, double lon, double radius, double seperation);

        double lastDistance; //hold last distance from current waypoint so we can check if we're increasing or not

        vector<Point> waypoints;

        // disable assignment and copy constructor
        GPSWaypointFollowingNode& operator=(const GPSWaypointFollowingNode&);
        GPSWaypointFollowingNode(const GPSWaypointFollowingNode&);

};

GPSWaypointFollowingNode::GPSWaypointFollowingNode(
        ros::NodeHandle nh,
        ros::NodeHandle private_nh) :
    nh_(nh),
    private_nh_(private_nh)
{
    
    xCurr = 0;
    yCurr = 0;
    thetaCurr = 0;
    waypointCurr = 0;
    pathFinished = false;

    canStart = false;

    haveValidOdom = false;

    lastDistance = DBL_MAX;
    
    pushControl = nh_.advertise<maestro::VelAndAngle>("converter_in", 10);
    cmd_vel_pub_ = nh_.advertise<geometry_msgs::Twist>("cmd_vel", 10);
    waypoint_viz_pub_ = nh_.advertise<visualization_msgs::MarkerArray>(std::string("/waypoint_viz"), 1);
    endpoint_viz_pub_ = nh_.advertise<visualization_msgs::MarkerArray>(std::string("/endpoint_viz"), 1);
    readOdometry = nh_.subscribe("/odom", 10, &GPSWaypointFollowingNode::odometryCallback, this);
    readStart = nh_.subscribe("start_command", 10, &GPSWaypointFollowingNode::startCallback, this);

    private_nh_.param("tolerance", tolerance_, 0.1);
    private_nh_.param("velocity", velocity_, 0.7);//0.7
    private_nh_.param("timeHorizon", timeHorizon_, 1.5);
    private_nh_.param("stepSize", stepSize_, 10);
    private_nh_.param("waypointFilename", waypointFilename_, std::string("/home/nuccar/roscar_ws/src/roscar/planner/src/indoorWaypoints.txt"));
    private_nh_.param("loop_rate", loop_rate_, 30.0);
    private_nh_.param("thetaRange", thetaRange_, 3.14);//2.5
    private_nh_.param("thetaResolution", thetaResolution_, 0.01);
    private_nh_.param("skipDistance", skipDistance_, 0.5);

  waypointFilename_.assign(std::string("/home/nuccar/roscar_2018/src/roscar/planner/src/indoorWaypoints.txt"));

    //first we set up our lookup tables by reading in our config files
    string waypointLine;
    ifstream waypointFile(waypointFilename_.c_str());
    bool first;

    if (waypointFile)
    {
        while ( getline (waypointFile, waypointLine) )
        {
            first = true;
            if(waypointFile.eof()){
                break;
            }

            string str(waypointLine);

			fprintf(stderr, "++++++++++Value is x: %s.\n", waypointFilename_.c_str());
            istringstream buf(str);
            istream_iterator<string> end;
            istream_iterator<string> beg(buf);
            vector<string> tokens(beg,end);

            Point waypoint;

            for(vector<string>::iterator it=tokens.begin(); it != tokens.end(); ++it)
            {
                //convert string to double
                double value = atof( (*it).c_str() );

                if(first){
                    waypoint.easting = value;
                    first = false; //set this flag to false so we know we want to set the second value next time through
                }
                else{
                    waypoint.northing = value;
                }
            }
			
            waypoints.push_back(waypoint);

        }

    waypointFile.close();
    }
    else { throw std::runtime_error("Waypoint config file failed to open"); }

}

void GPSWaypointFollowingNode::odometryCallback(const nav_msgs::Odometry::ConstPtr& msg){

    boost::mutex::scoped_lock lock(position_lock_);

    xCurr = msg->pose.pose.position.x;
    yCurr = msg->pose.pose.position.y;

    //convert quaternion to euler and grab the yaw for our theta
    tf::Quaternion q(msg->pose.pose.orientation.x, msg->pose.pose.orientation.y, msg->pose.pose.orientation.z, msg->pose.pose.orientation.w);
    tf::Matrix3x3 m(q);
    double roll, pitch, yaw;
    m.getRPY(roll, pitch, yaw);

    thetaCurr = yaw;
    
	cout<< "	xCurr: " << xCurr << " yCUrr: " << yCurr << endl;
	//cout<< "theta CUrr: " << thetaCurr << endl;

    odom_frame_ = msg->header.frame_id;
    haveValidOdom = true;

}

void GPSWaypointFollowingNode::startCallback(const std_msgs::String::ConstPtr& msg){

    if(msg->data == "start"){
        canStart = true;
    }
}

double GPSWaypointFollowingNode::distance(double x1, double y1, double x2, double y2){

    double diff1 = pow( (x1 - x2) , 2);
    double diff2 = pow( (y1 - y2) , 2);
    
    double dist = sqrt( diff1 + diff2 );

    return dist;
    
}

bool GPSWaypointFollowingNode::atWaypoint(double x, double y){

    //calculate current distance from current waypoint
    double dist = distance(x, y, waypoints[waypointCurr].easting, waypoints[waypointCurr].northing);
    //fprintf(stderr, "	best x: %f, best y: %f,\n	WaypointEasting: %f, WaypointNorthing: %f,\n	distance: %f.\n", x, y, waypoints[waypointCurr].easting, waypoints[waypointCurr].northing, dist); 
    
    /*

    //if dist increasing and we are a certain dist away from waypoint then SKIP IT
    if(dist > lastDistance){
        if(dist > skipDistance_){
            if(waypointCurr < (waypoints.size()-1) ){
                waypointCurr++;
                lastDistance = DBL_MAX;
            }
            else{
                //skipping the final waypoint
                cout << "Missed the final waypoint" << endl;
                cout << "Current X: " << x << endl;
                cout << "Current Y: " << y << endl;
                cout << endl;
                pathFinished = true;
                return true;
            }
            
            //check if we just hit our final waypoint
            if(waypointCurr >= (waypoints.size()-1) ){
                pathFinished = true;
            }
            
            cout << "Missed current waypoint (skipped)" << endl;
            cout << "Current X: " << x << endl;
            cout << "Current Y: " << y << endl;
            cout << endl;

            return true;
        }
    }

    */


    lastDistance = dist; //set last distance

    if(dist <= tolerance_){
        waypointCurr++;
        
        lastDistance = DBL_MAX; //reset last distance
        
        cout << "Hit current waypoint" << endl;
        cout << "Current X: " << x << endl;
        cout << "Current Y: " << y << endl;

        //check if we just hit our final waypoint
        if(waypointCurr >= waypoints.size() ){
            pathFinished = true;
        }

        return true;
    }
    else{
        return false;
    }

}

double GPSWaypointFollowingNode::sampleAndProjectControls(){
    whiskers_.clear();

    //create vector of sample ang velocities
    vector<double> sampleAngs;

    //start our sampleAngs at negative of the theta range
    double currAng = -1 * thetaRange_;
    sampleAngs.push_back(currAng);

    //populate our sampleAngs vector with angles separated by thetaResolution
    while(currAng <= thetaRange_){
        currAng = currAng + thetaResolution_;
        sampleAngs.push_back(currAng);
    }

    double thetaPrime;
    double xPrime;
    double yPrime;
    double dist;
    double angVel;

    double bestAngle;
    double bestDistance = INT_MAX;
    double bestX;
    double bestY;
    int count = 0;
	fprintf(stderr, "GPS\n");
	//fprintf(stderr,"	thetaCurr: %f", thetaCurr);
    //for each sampled angVel, calc projected x,y and compute distance from waypoint
    //create vector of projected distances from waypoint
    for(int i=0; i < sampleAngs.size(); i++){
        xPrime = xCurr;
        yPrime = yCurr;
        thetaPrime = thetaCurr;
        dist = 0;

        angVel = sampleAngs[i];
		
		/*
        for (int j = 0; j < stepSize_; j++) {
            xPrime = xPrime + (velocity_ * timeHorizon_/stepSize_ * ( cos(thetaPrime) ) );
            yPrime = yPrime + (velocity_ * timeHorizon_/stepSize_ * ( sin(thetaPrime) ) );
            thetaPrime = thetaPrime + ( timeHorizon_/stepSize_ * angVel);
            thetaPrime = boundAngle(thetaPrime);
        }
        */
        thetaPrime = thetaPrime + ( timeHorizon_ * angVel);
        thetaPrime = boundAngle(thetaPrime);
        xPrime = xPrime + (velocity_ * timeHorizon_ * ( cos(thetaPrime) ) );
        yPrime = yPrime + (velocity_ * timeHorizon_ * ( sin(thetaPrime) ) );
        
        


        //////////////////////////////
        Point p;
        p.easting = xPrime;
        p.northing = yPrime;
        whiskers_.push_back(p);
        //////////////////////////////////

        //computer distance of our new point to the currWaypoint
        dist = distance(xPrime, yPrime, waypoints[waypointCurr].easting, waypoints[waypointCurr].northing);
		//fprintf(stderr, "	For angle %f, xPrime: %f, yPrime: %f, distance: %f\n", angVel, xPrime, yPrime, dist);
		
        //update bestAngle so we keep track of which angle has the best projection
        if(dist < bestDistance){
            bestDistance = dist;
            bestAngle = angVel;
            bestX = xPrime;
            bestY = yPrime;
            count = i;
        }
    }
    best_point_.easting = bestX;
    best_point_.northing = bestY;

    //picked sample angVel with lowest projected dist from waypoint and return
    
    atWaypoint(bestX, bestY);

    //return (-1 * bestAngle); //return negative of best angle because converter is backwards (IMU upside down)

	fprintf(stderr, "	best angle: %f, best x: %f, best y: %f , best distance: %f \n", bestAngle, bestX, bestY, bestDistance); 
    return (bestAngle);

}

double GPSWaypointFollowingNode::boundAngle(double ang){

    double boundedAng = ang;

    while(boundedAng <= (-1 * M_PI)){
        boundedAng = boundedAng + (2 * M_PI);
    }
    while(boundedAng > M_PI){
        boundedAng = boundedAng - (2 * M_PI);
    }

    return boundedAng;

}

//Creates GPS waypoints based on starting point and equations
void createGPSWaypointCircle(double lat, double lon, double radius, double seperation){
	//convert lat,lon to UTM
	/*geographic_msgs::GeoPoint p;
        p.latitude = lat;
        p.longitude = lon;
        geodesy::UTMPoint p_utm;
        geodesy::fromMsg(p, p_utm);
        double easting = p_utm.easting;
        double northing = p_utm.northing;*/

	



}


void GPSWaypointFollowingNode::run() {

    ros::Rate loop_rate(loop_rate_);

	// manual
	canStart = true;
	std::cout << canStart << std::endl;
    while (ros::ok() && !pathFinished) {	
        if(haveValidOdom && canStart){
            //then sample some angular velocities and project them using our kinematics and return the best one
            double angVel = sampleAndProjectControls();

            maestro::VelAndAngle msg;
            msg.velocity = velocity_;
            msg.angle = angVel;

		//fprintf(stderr, "	GPS_angVel: %f.\n", angVel);
		//fprintf(stderr, "In GPS_velocity %f.\n\n", msg.velocity);

            pushControl.publish(msg);
    
            geometry_msgs::Twist cmd_vel;
            cmd_vel.linear.x = velocity_;
            cmd_vel.angular.z = angVel;

            cmd_vel_pub_.publish(cmd_vel);

            haveValidOdom = false; //reset this flag till we get another odom message

            ros::spinOnce();
            loop_rate.sleep();
        }
        
        publishWaypoints();
        publishEndpoints();
        ros::spinOnce();
        loop_rate.sleep();

    }
    
    cout << "Finished path" << endl;

    //once we finish our path, publish 0 vel and 0 angular vel 
    maestro::VelAndAngle msg;
    msg.velocity = 0;
    msg.angle = 0;
    int count = 0;
    while(count < 10000){
        count = count + 1;
        pushControl.publish(msg);
    }
}

void GPSWaypointFollowingNode::publishWaypoints() {
    visualization_msgs::MarkerArray waypoint_markers;
    for (unsigned int i = 0; i < waypoints.size(); i++) {
        visualization_msgs::Marker new_marker;
        new_marker.header.frame_id = odom_frame_;
        new_marker.header.stamp = ros::Time::now();
        new_marker.id = i;
        new_marker.ns = "waypoint_markers";
        new_marker.type = visualization_msgs::Marker::CYLINDER;
        new_marker.action = visualization_msgs::Marker::ADD;
        new_marker.pose.position.x = waypoints[i].easting;
        new_marker.pose.position.y = waypoints[i].northing;
        new_marker.pose.position.z = 0.0;
        new_marker.scale.x = 2 * tolerance_;
        new_marker.scale.y = 2 * tolerance_;
        new_marker.scale.z = 0.01;
        new_marker.color.a = 0.3;
        new_marker.color.r = 0.1;
        new_marker.color.g = 0.5;
        new_marker.color.b = 1.0;
        new_marker.lifetime = ros::Duration(1);
        waypoint_markers.markers.push_back(new_marker);
    }
    waypoint_viz_pub_.publish(waypoint_markers);
}

void GPSWaypointFollowingNode::publishEndpoints() {
    visualization_msgs::MarkerArray endpoint_markers;

    double diameter = 0.2;
    ros::Time t = ros::Time::now();

    for (unsigned int i = 0; i < whiskers_.size(); i++) {
        visualization_msgs::Marker new_marker;
        new_marker.header.frame_id = odom_frame_;
        new_marker.header.stamp = t;
        new_marker.id = i;
        new_marker.ns = "endpoint_markers";
        new_marker.type = visualization_msgs::Marker::CYLINDER;
        new_marker.action = visualization_msgs::Marker::ADD;
        new_marker.pose.position.x = whiskers_[i].easting;
        new_marker.pose.position.y = whiskers_[i].northing;
        new_marker.pose.position.z = 0.0;
        new_marker.scale.x = diameter;
        new_marker.scale.y = diameter;
        new_marker.scale.z = 0.01;
        new_marker.color.a = 1.0;
        new_marker.color.r = 1.0;
        new_marker.color.g = 0.0;
        new_marker.color.b = 0.0;
        if (whiskers_[i].easting == best_point_.easting &&
                whiskers_[i].northing == best_point_.northing) {
            new_marker.color.r = 0.0;
            new_marker.color.g = 1.0;
            new_marker.color.b = 0.0;
        }
        new_marker.lifetime = ros::Duration(1);
        endpoint_markers.markers.push_back(new_marker);
    }

    endpoint_viz_pub_.publish(endpoint_markers);
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "gps_waypoint_following_node");
    ros::NodeHandle nh;
    ros::NodeHandle private_nh("~");

    try {
        GPSWaypointFollowingNode cn(nh, private_nh);
		cout << "GPS Node" << endl;
        cn.run();
    }
    catch(std::runtime_error ex) {
        ROS_ERROR("%s", ex.what());
        return -1;
    }

    return 0;
}

