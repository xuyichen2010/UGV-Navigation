#include "ros/ros.h"

#include "maestro/Maestro.h"
#include "maestro/Converter.h"
#include "maestro/MaestroOut.h"
#include "maestro/MaestroIn.h"
#include "maestro/VelAndAngle.h"
#include "geometry_msgs/Twist.h"
#include "phidget_spatial/Inertia.h"

#include <fstream>
#include <string>
#include <vector>
#include <iostream>
#include <string.h>
#include <iterator>
#include <sstream>
#include <stdlib.h>

using namespace std;

class ConverterNode {
public:
    ConverterNode(ros::NodeHandle, ros::NodeHandle);
    ~ConverterNode();
    //void targetsCallback(const maestro::VelAndAngle::ConstPtr&);
    void targetsCallback(const geometry_msgs::Twist::ConstPtr&);
    void pulsewidthCallback(const maestro::MaestroOut::ConstPtr&);
    void imuCallback(const phidget_spatial::Inertia::ConstPtr&);
    void run();
    
private:
    ros::NodeHandle nh_;
    ros::NodeHandle private_nh_;
    ros::Publisher convertedTargets;
    ros::Publisher convertedPulseWidths;
    ros::Subscriber targets;
    ros::Subscriber pulseWidths;
    ros::Subscriber readIMU;
    
    double loop_rate_;
    double kp_;

    double currentOmega;
    double desiredOmega;

    string motor_config;
    string servo_config;

    Converter* conv_;
};

ConverterNode::ConverterNode(
        ros::NodeHandle nh, 
        ros::NodeHandle private_nh) :
    nh_(nh),
    private_nh_(private_nh)
{
    convertedTargets = nh_.advertise<maestro::MaestroIn>("maestro_in", 20);
    convertedPulseWidths = nh_.advertise<maestro::VelAndAngle>("converter_out", 20);
    //targets = nh_.subscribe("converter_in", 20, &ConverterNode::targetsCallback, this);
    targets = nh_.subscribe("cmd_vel", 20, &ConverterNode::targetsCallback, this);
    pulseWidths = nh_.subscribe("maestro_out", 20, &ConverterNode::pulsewidthCallback, this);
    readIMU = nh_.subscribe("inertia", 10, &ConverterNode::imuCallback, this);
    
    private_nh_.param("motor_config", motor_config, std::string("/home/reu/roscar_ws/src/roscar/maestro/src/motorConfig.txt"));
    private_nh_.param("servo_config", servo_config, std::string("/home/reu/roscar_ws/src/roscar/maestro/src/servoConfig.txt"));
    private_nh_.param("loop_rate", loop_rate_, 20.0);
    private_nh_.param("kp", kp_, 1.0);

    conv_ = new Converter(motor_config, servo_config);
    

}

ConverterNode::~ConverterNode(){
    delete conv_;
}

void ConverterNode::imuCallback(const phidget_spatial::Inertia::ConstPtr& msg){

    currentOmega = (msg -> zAngular) * (M_PI / 180.0);
    //fprintf(stderr, "	CUrrentOmega_fromSPatial: %f.\n", currentOmega);

}

void ConverterNode::targetsCallback(const geometry_msgs::Twist::ConstPtr& twistmsg) {
	double convertedVel = 0;
    	double convertedAngle = 0;
	double vel_x = twistmsg->linear.x;
	double vel_y = twistmsg->linear.y;
	double vel_th = twistmsg->angular.z;
	fprintf(stderr, "	Twist message: Vel: x: %f, y: %f; Ang: %f.\n", vel_x, vel_y, vel_th);
	double velocity = sqrt(vel_x * vel_x + vel_y * vel_y);
	desiredOmega = -1 * vel_th;

	int amplifier = 10;
	if(desiredOmega <= 0){
	    amplifier = 20;
	}

	double angV = desiredOmega  + (kp_ * (desiredOmega - currentOmega) );
	//std::cout << "desireOmega(-angular.z): " << desiredOmega << ", currentOmega: " << currentOmega << ", angV: " << angV << std::endl;
	// convert to pulsewidth
	conv_->convertToPulsewidth(velocity, angV, convertedVel, convertedAngle);

	//publish the conversion
    	maestro::MaestroIn mi;
    	mi.drive_position = convertedVel;
    	mi.steering_position = convertedAngle;
	fprintf(stderr, "	Drive Position is %f.\n", convertedVel);
	//fprintf(stderr, "Steering Position is %f.\n\n", convertedAngle); 
    	convertedTargets.publish(mi);
	
	
}
/*
void ConverterNode::targetsCallback(const maestro::VelAndAngle::ConstPtr& msg) {

    //check our linked vectors
    double convertedVel = 0;
    double convertedAngle = 0;
    double vel = msg->velocity;
    //double ang = msg->angle;
    desiredOmega = -1 * msg->angle; // TODO

    //now use proportional controller to calculate desired angular velocity
    double ang = desiredOmega + (kp_ * (desiredOmega - currentOmega) );

    //convert to pulsewidth
    conv_->convertToPulsewidth(vel, ang, convertedVel, convertedAngle);

    //publish the conversion
    maestro::MaestroIn mi;
    mi.drive_position = convertedVel;
    mi.steering_position = convertedAngle;
	//fprintf(stderr, "Drive Position is %f.\n", convertedVel);
	//fprintf(stderr, "Steering Position is %f.\n\n", convertedAngle); 
    convertedTargets.publish(mi);
}*/

void ConverterNode::pulsewidthCallback(const maestro::MaestroOut::ConstPtr& msg){

    //check our linked vectors
    double convertedVel = 0;
    double convertedAngle = 0;
    double vel = msg->drive_position;
    double ang = msg->steering_position;

	

    //convert from pulsewidth
    conv_->convertFromPulsewidth(vel, ang, convertedVel, convertedAngle);

    //publish the conversion
    maestro::VelAndAngle mi;
    mi.velocity = convertedVel;
    mi.angle = convertedAngle;
	//fprintf(stderr, "Converter\n");
	//fprintf(stderr, "	Converter_Velocity: %f.\n", convertedVel);
	//fprintf(stderr, "	Converter_Angle: %f.\n\n", convertedAngle); 

    mi.currTime = msg->currTime; //transmit time from maestro out message
    convertedPulseWidths.publish(mi);

}

void ConverterNode::run() {
    ros::Rate loop_rate(loop_rate_);

    ros::spin();

}

int main(int argc, char** argv) {
    ros::init(argc, argv, "converter");
    ros::NodeHandle nh;
    ros::NodeHandle private_nh("~");

    try {
        ConverterNode mn(nh, private_nh);
        mn.run();
    }
    catch(std::runtime_error ex) {
        ROS_ERROR("%s", ex.what());
        return -1;
    }

    return 0;
}

