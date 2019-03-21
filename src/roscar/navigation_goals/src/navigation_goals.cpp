#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include "phidget_gps/Data.h"
#include <geodesy/utm.h>
#include <iostream>
#include <cmath>  

typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;

double current_x;
double current_y;
double current_heading;
bool gpsUp;
boost::mutex ekf_lock_;

void gpsCallback(const phidget_gps::Data::ConstPtr& msg) {
	ROS_INFO("WOW");
	boost::mutex::scoped_lock lock(ekf_lock_);
	geographic_msgs::GeoPoint p;
        p.latitude = msg->latitude;
        p.longitude = msg->longitude;
        p.altitude = msg->altitude;
        geodesy::UTMPoint p_utm;
        geodesy::fromMsg(p, p_utm);

	current_y = p_utm.easting;
        current_x = p_utm.northing;
	current_heading = -1 * (msg->heading - 90.0) * (M_PI / 180.0);
	while(current_heading <= (-1 * M_PI)){
		current_heading = current_heading + (2 * M_PI);
    	}
    	while(current_heading > M_PI){
    		current_heading = current_heading - (2 * M_PI);
    	}
	ROS_INFO("Recieve GPS: %f, %f", current_x, current_y);
	gpsUp = true;
}

double boundAngle(double ang){

    double boundedAng = ang;

    while(boundedAng <= (-1 * M_PI)){
        boundedAng = boundedAng + (2 * M_PI);
    }
    while(boundedAng > M_PI){
        boundedAng = boundedAng - (2 * M_PI);
    }

    return boundedAng;

}


int main(int argc, char** argv){
  ros::init(argc, argv, "simple_navigation_goals");
  ros::NodeHandle nh;

  ros::Subscriber sub = nh.subscribe("gps_data", 1, &gpsCallback);

  while(!gpsUp){
	ROS_WARN("... Waiting GPS signal ...");
  }

  //tell the action client that we want to spin a thread by default
  MoveBaseClient ac("move_base", true);

  //wait for the action server to come up
  while(!ac.waitForServer(ros::Duration(5.0))){
    ROS_INFO("Waiting for the move_base action server to come up");
  }

  move_base_msgs::MoveBaseGoal goal;

  //we'll send a goal to the robot to move 1 meter forward
  goal.target_pose.header.frame_id = "odom";
  goal.target_pose.header.stamp = ros::Time::now();

  goal.target_pose.pose.position.x = current_x + 5;
  goal.target_pose.pose.position.y = current_y;
  goal.target_pose.pose.orientation.w = current_heading;

  ROS_INFO("Sending goal: x->%f, y->%f",goal.target_pose.pose.position.x,goal.target_pose.pose.position.y);
  ac.sendGoal(goal);

  ac.waitForResult();

  if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
    ROS_INFO("Hooray, the base moved 1 meter forward");
  else
    ROS_INFO("The base failed to move forward 1 meter for some reason");

  return 0;
}
