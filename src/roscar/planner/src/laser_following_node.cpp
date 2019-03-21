#include "ros/ros.h"

#include "maestro/VelAndAngle.h"
#include "std_msgs/String.h"
#include "utm_laser/Laser.h"

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

//coordinats in rectangular
struct Point {
    	double easting;
    	double northing;
};

//coordiantes in polar
struct PolarPoint {
    	double radius;
    	double theta;
};

//commands to be sent to the Maestro controller
struct Commands {
    	double velocity;
	    double angle;
};

class LaserFollowingNode {
    public:
        LaserFollowingNode(ros::NodeHandle, ros::NodeHandle);
        void startCallback(const std_msgs::String::ConstPtr&);
	void targetCoordinatesCallback(const utm_laser::Laser::ConstPtr&);
	double boundAngle(double ang);
        void run();

    private:
        ros::NodeHandle nh_;
        ros::NodeHandle private_nh_;
        ros::Subscriber readStart;
	ros::Subscriber readLaser;
        ros::Publisher pushControl;
        std::vector<Point> whiskers_;	//projected points

        //lock for the position data
        boost::mutex position_lock_;
        
	//target coordinates
	double laser_x_;
	double laser_y_;

        bool canStart; //can we start planning yet or not
        bool haveValidCoords; //keep track of when we have valid laser coordinates
        bool firstBrake;    //keep track of dynamic goal completion finished for breaking 
        int BRAKE_PULSE_COUNT;
        int counter;
        //parameters  /////////////
        double GOAL_RADIUS; //how far from the current waypoint must we be to be considered at the waypoint
        double VEL_RATIO; //constant determines speed based on distance
        double TIME_HORIZON; //how far we will project our samples
        double TIME_SLICE; //our dt
        double loop_rate_;
        double OMEGA_RESOLUTION; //how finely we chop up the thetaRange when sampling (radians)
	double COST_CONST_K;  //constant for cost function puts weights on orientation versus distance
	double RADIUS_MIN;  //minimum turning 
	double BRAKING_SPEED;
	/////////////////////////
	
    double distance(double x1, double y1, double x2, double y2);
	PolarPoint rectangularToPolar(double x, double y);
	Point polarToRectangular(double radius, double theta);	
	double sinSquared(double radians);
    Commands sampleAndProjectControls();
	void createGPSWaypoints(double lat, double lon, double radius, double seperation);
    Commands brakeCommands(); 
        
    vector<Point> waypoints;
    vector<int> hit_array;
    vector<int> miss_array;

        // disable assignment and copy constructor
        LaserFollowingNode& operator=(const LaserFollowingNode&);
        LaserFollowingNode(const LaserFollowingNode&);

};

LaserFollowingNode::LaserFollowingNode(
        ros::NodeHandle nh,
        ros::NodeHandle private_nh) :
    nh_(nh),
    private_nh_(private_nh)
{
    
    //params necessary to initiate the planner	
    canStart = false;
    haveValidCoords = false;
    firstBrake = true;
 
    pushControl = nh_.advertise<maestro::VelAndAngle>("converter_in", 20);
    readStart = nh_.subscribe("start_command", 10, &LaserFollowingNode::startCallback, this);
    ros::Rate loop_rate(loop_rate_);
    readLaser = nh_.subscribe("target_xy", 20, &LaserFollowingNode::targetCoordinatesCallback, this);


    private_nh_.param("goal_radius", GOAL_RADIUS, 1.0);
    private_nh_.param("vel_ratio", VEL_RATIO, 0.75);
    private_nh_.param("time_horizon", TIME_HORIZON, 1.0);
    private_nh_.param("time_slice", TIME_SLICE, 0.05);
    private_nh_.param("loop_rate", loop_rate_, 20.0);
    private_nh_.param("omega_resolution", OMEGA_RESOLUTION, 0.1);
    private_nh_.param("cost_const_k", COST_CONST_K, 2.0);
    private_nh_.param("radius_min", RADIUS_MIN, 0.5);
    private_nh_.param("braking_speed", BRAKING_SPEED, -15.0);    
    private_nh_.param("brake_counter", BRAKE_PULSE_COUNT, 10);   
    counter = 0; 
    
}

//set the target coordinates from the laser to member variables
void LaserFollowingNode::targetCoordinatesCallback(const utm_laser::Laser::ConstPtr& msg){	
	boost::mutex::scoped_lock lock(position_lock_);
	if(msg->Target_Easting == 0 && msg->Target_Northing == 0 ){
		//target not recognized do not sample and project.
		haveValidCoords = false;
		return;
	}
	laser_x_ = msg->Target_Easting;
	laser_y_ = msg->Target_Northing; 

	    //ROS_INFO("Best point, x= %f, y= %f", laser_x_ , laser_y_);


	haveValidCoords = true;
	return;
}

//Callback function used to start the robots planner loop
void LaserFollowingNode::startCallback(const std_msgs::String::ConstPtr& msg){
    if(msg->data == "start"){
        canStart = true;
    }
}

//Euclidean distance function takes in two points in the cartesian plane, returns the distance 
double LaserFollowingNode::distance(double x1, double y1, double x2, double y2){
    double diff1 = pow( (x1 - x2) , 2);
    double diff2 = pow( (y1 - y2) , 2);
    
    double dist = sqrt( diff1 + diff2 );

    return dist;
}

//function takes in x and y coordinates and converts to polar (radius and theta) as a PolarPoint struct
PolarPoint LaserFollowingNode::rectangularToPolar(double x, double y){
	PolarPoint pp;
	pp.radius = hypot(x,y);
    pp.theta = atan2( y,x );  // -pi to pi
    return pp;
}

//Takes in radius and theta and converts to Point (x,y) coords
Point LaserFollowingNode::polarToRectangular(double radius, double theta){
	Point p;
	p.easting = radius * cos(theta);
	p.northing = radius * sin(theta);
	return p;
}

//takes in radians and computes the sin^2(x) using a double angle formula, outputs a ratio
double LaserFollowingNode::sinSquared(double radians){
	return (1 - cos(2*radians)) / 2;	
}


Commands LaserFollowingNode::brakeCommands(){
    Commands cmd;
	cmd.velocity = BRAKING_SPEED;
	cmd.angle = 0.;
	return cmd;
} 


Commands LaserFollowingNode::sampleAndProjectControls(){
	whiskers_.clear();
    	Commands cmd;    
	const double GRAPH_ADJUSTMENT = M_PI/2;

	
	Point best_point;	//chosen trajectory point based on cost
  	double command_velocity = 0;  //velocity to send to maestro
	double command_theta = 0;	//angle to send to maestro
	PolarPoint target_polar_coord = rectangularToPolar(laser_x_, laser_y_);
	//adjust target coord based on edge of goal radius	
	double radius_target = target_polar_coord.radius - GOAL_RADIUS;
	double theta_target = target_polar_coord.theta - GRAPH_ADJUSTMENT;
	theta_target = boundAngle(theta_target);
    
    //within following distance command the robot to stop and wait.
    if(radius_target <= GOAL_RADIUS && firstBrake){
        cmd = brakeCommands();    //send commands for smooth brake to stop momentum
        counter++;
        if(counter > BRAKE_PULSE_COUNT){
            firstBrake = false;        
            counter = 0;
        }
        return cmd;
    }
    else if(radius_target <= GOAL_RADIUS && !firstBrake){
        cmd.velocity = 0.;
	    cmd.angle = 0.;
        return cmd;
    }
    else{
        firstBrake = true;
        counter = 0;
    }

	Point target_coord = polarToRectangular(radius_target, theta_target); 
	//Compute command velocity 
	command_velocity = VEL_RATIO * radius_target; 
	//compute omega range from V
	double omega_max = command_velocity / RADIUS_MIN;
	//sample and project distance while minimizing cost
	double bestCost = 10000000;
	double command_omega = 0.;
	
	//iterate over possible angular speeds
	double omega = -1*omega_max;
	while(omega <= omega_max){
		//step through time with linear approximations to get a curve
		double x = 0;
		double y = 0;
		double theta = M_PI/2;  //graph adjustment TODOOOO
		for(int i = 0; i < (int)(TIME_HORIZON/TIME_SLICE); i++){
			x = x + command_velocity*cos(theta)*TIME_SLICE;
			y = y + command_velocity*sin(theta)*TIME_SLICE;
			theta = theta + omega*TIME_SLICE;
		}	
		Point projected_point;
		projected_point.easting = x;
		projected_point.northing = y;
		whiskers_.push_back(projected_point);
		//cost function is distance between projection and person, look into tolerance ring, also incorporate robot theta 
		double cost = COST_CONST_K*sinSquared((theta_target - theta)/2) + distance(x, y, target_coord.easting, target_coord.northing);
		//compare costs to minimize
		if(cost < bestCost){
			bestCost = cost;
			command_omega = omega;
			best_point.easting = x;
			best_point.northing = y;
			command_theta = theta;
		}
		omega += OMEGA_RESOLUTION;
	}

	//send motor control to Converter -> Maestro -> robot motors
	cmd.velocity = command_velocity;
	cmd.angle = command_theta;
    return cmd;
}

double LaserFollowingNode::boundAngle(double ang){

    double boundedAng = ang;

    while(boundedAng <= (-1 * M_PI)){
        boundedAng = boundedAng + (2 * M_PI);
    }
    while(boundedAng > M_PI){
        boundedAng = boundedAng - (2 * M_PI);
    }

    return boundedAng;

}


void LaserFollowingNode::run() {

    ros::Rate loop_rate(loop_rate_);
	
    while (ros::ok()) {

    	canStart = true;
    	Commands cmd;    
    	if(haveValidCoords && canStart){
        	//then sample some angular velocities and project them using our kinematics and return the best one
            cmd = sampleAndProjectControls();
	    	haveValidCoords = false;

            hit_array.push_back(0);
    	}
    	else{
		    if(firstBrake){
        		cmd = brakeCommands();    //send commands for smooth brake to stop momentum
        		counter++;
                if(counter > BRAKE_PULSE_COUNT){
                    firstBrake = false;        
                    counter = 0;
                }
		    }
		    else if(!firstBrake){
			    cmd.velocity = 0.;
			    cmd.angle = 0.;
		    }
   	        miss_array.push_back(0); 
       }
        double metric = (double)hit_array.size() / (double)(hit_array.size() + miss_array.size());
		
        ROS_INFO("Percent accuracy: %f", metric);        

        maestro::VelAndAngle msg;
	    msg.velocity = cmd.velocity;
    	msg.angle = cmd.angle;
        pushControl.publish(msg);        
        ros::spinOnce();
        loop_rate.sleep();
    }
}


int main(int argc, char** argv) {
    ros::init(argc, argv, "laser_following_node");
    ros::NodeHandle nh;
    ros::NodeHandle private_nh("~");

    try {
        LaserFollowingNode cn(nh, private_nh);
        cn.run();
    }
    catch(std::runtime_error ex) {
        ROS_ERROR("%s", ex.what());
        return -1;
    }

    return 0;
}

