#include "ros/ros.h"
#include <tf/transform_broadcaster.h>

#include "maestro/VelAndAngle.h"
#include "nav_msgs/Odometry.h"

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

using namespace std;

struct Point {
    double easting;
    double northing;
};

class PerfectWaypointFollower {
    public:
        PerfectWaypointFollower(ros::NodeHandle, ros::NodeHandle);
        void controlCallback(const maestro::VelAndAngle::ConstPtr&);
        double boundAngle(double ang);
        void run();

    private:
        ros::NodeHandle nh_;
        ros::NodeHandle private_nh_;
        ros::Subscriber readControl;
        ros::Publisher pushOdom;

        //lock for the position data
        boost::mutex position_lock_;
        
        //current position elements
        double xCurr;
        double yCurr;
        double thetaCurr;

        double velCurr;
        double omegaCurr;

        double loop_rate_;
                
        // disable assignment and copy constructor
        PerfectWaypointFollower& operator=(const PerfectWaypointFollower&);
        PerfectWaypointFollower(const PerfectWaypointFollower&);

};

PerfectWaypointFollower::PerfectWaypointFollower(
        ros::NodeHandle nh, 
        ros::NodeHandle private_nh) :
    nh_(nh),
    private_nh_(private_nh)
{
    
    xCurr = 0;
    yCurr = 0;
    thetaCurr = 0;
       
    velCurr = 0.0;
    omegaCurr = 0.0;

    pushOdom = nh_.advertise<nav_msgs::Odometry>("odometry", 10);
    readControl = nh_.subscribe("converter_in", 10, &PerfectWaypointFollower::controlCallback, this);

    private_nh_.param("loop_rate", loop_rate_, 30.0);

    
}

void PerfectWaypointFollower::controlCallback(const maestro::VelAndAngle::ConstPtr& msg){

    velCurr = msg->velocity;
    omegaCurr = msg->angle;

}

void PerfectWaypointFollower::run() {

    ros::Rate loop_rate(loop_rate_);

    while (ros::ok()) {

        double dt = 1 / loop_rate_;

        nav_msgs::Odometry msg;
        
        double xPrime, yPrime, thetaPrime, dtheta;

        xPrime = xCurr + (velCurr * dt * (cos(thetaCurr) ));
        yPrime = yCurr + (velCurr * dt * (sin(thetaCurr) ));
        dtheta = omegaCurr * dt;
        thetaPrime = thetaCurr + dtheta;

        thetaPrime = boundAngle(thetaPrime);

        msg.pose.pose.position.x = xPrime;
        msg.pose.pose.position.y = yPrime;
        msg.pose.pose.position.z = 0.0;

        //turn our yaw into a quaternion
        tf::Quaternion q;
        q.setRPY(0,0,thetaPrime); //roll = 0, pitch = 0, yaw = thetaPrime
        geometry_msgs::Quaternion odom_quat;
        tf::quaternionTFToMsg(q, odom_quat);  

        //set our quaternion
        msg.pose.pose.orientation = odom_quat;

        xCurr = xPrime;
        yCurr = yPrime;
        thetaCurr = thetaPrime;

        pushOdom.publish(msg);

        ros::spinOnce();
        loop_rate.sleep();

    }
}

double PerfectWaypointFollower::boundAngle(double ang){

    double boundedAng = ang;

    while(boundedAng <= (-1 * M_PI)){
        boundedAng = boundedAng + (2 * M_PI);
    }
    while(boundedAng > M_PI){
        boundedAng = boundedAng - (2 * M_PI);
    }

    return boundedAng;

}


int main(int argc, char** argv) {
    ros::init(argc, argv, "perfect_waypoint_following_node");
    ros::NodeHandle nh;
    ros::NodeHandle private_nh("~");

    try {
        PerfectWaypointFollower cn(nh, private_nh);
        cn.run();
    }
    catch(std::runtime_error ex) {
        ROS_ERROR("%s", ex.what());
        return -1;
    }

    return 0;
}


