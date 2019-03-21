#include "ros/ros.h"
#include "maestro/VelAndAngle.h"
#include "maestro/MaestroIn.h"
#include <sensor_msgs/Joy.h>

#include <iostream>

using namespace std;

class XboxControllerNode {
public:
    XboxControllerNode(ros::NodeHandle, ros::NodeHandle);
    void joystickCallback(const sensor_msgs::Joy::ConstPtr& msg);
    void run();
private:
    ros::NodeHandle nh_;
    ros::NodeHandle private_nh_;
    ros::Publisher converterCommand;
    ros::Publisher maestroCommand;
    ros::Subscriber readJoystick;
    double throttle;
    double turning;
    double backup;
    double forward;
    bool pastBeginning;

    // disable assignment and copy constructor
    XboxControllerNode& operator=(const XboxControllerNode&);
    XboxControllerNode(const XboxControllerNode&);
};

XboxControllerNode::XboxControllerNode(
        ros::NodeHandle nh,
        ros::NodeHandle private_nh) :
    nh_(nh),
    private_nh_(private_nh)
{
    throttle = 0;
    turning = 0;
    backup = 0;
    forward = 0;
    pastBeginning = false;
    converterCommand = nh_.advertise<maestro::VelAndAngle>("converter_in", 10);
    //maestroCommand = nh_.advertise<maestro::MaestroIn>("maestro_in", 10);
    readJoystick = nh_.subscribe<sensor_msgs::Joy>("joy", 10, &XboxControllerNode::joystickCallback, this);
}

void XboxControllerNode::joystickCallback(const sensor_msgs::Joy::ConstPtr& msg){
    throttle = msg->axes[5]; 
    backup = msg->buttons[1];
    forward = msg->buttons[0];
    turning = msg->axes[0];
    turning = -1 * turning;
    /*
    if(throttle != 0){
        pastBeginning = true;
    }
    
    //maps descending positive range to half of speed range (0-5)m/s
    if(throttle<=1.0 && throttle >=0 && pastBeginning == true){
        throttle = (1-throttle)*5;
    }
    //maps descending negative range to (5-10)m/s
    else if(throttle < 0 && throttle>=(-1.0)){
        throttle = (((-1)*throttle)*5)+5;
    }
    else if(throttle == 0 && pastBeginning == false){
        throttle = 0;
    }
    else{
        throttle = 0;
    }*/

    // Press A to drive!
    if(forward==1){
        throttle = 2.0;
        turning = 2.0;
    }
    else{
        throttle = 0;
        turning = 0;
    }

    
    double noise = 0.1;

    //maps radio input to rad/s
    if(turning>=(-1.0) && turning <= (-1 * noise)){
        //turning = 5700;
        //turning = (turning + noise) * (2.0 / (1.0 - noise));     
    }
    else if(turning >= noise && turning <= 1.0){
        //turning = 6300;
        //turning = (turning - noise) * (2.0 / (1.0-noise));    
    }
    else{
        //turning = 0;
    }
    
    //small reverse for backing up
    if(backup==1){
        throttle = -2.0;  //will exceed lowest value on lookup table
        turning = 0;
    }
 
    //now publish
    maestro::VelAndAngle msg2;
    msg2.velocity = throttle;
    msg2.angle = turning;
    converterCommand.publish(msg2);
    /*
    maestro::MaestroIn msg2;
    msg2.drive_position = throttle;
    msg2.steering_position = turning;
    maestroCommand.publish(msg2);
    */
}

void XboxControllerNode::run() {
    ros::spin();
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "xbox_controller_node");
    ros::NodeHandle nh;
    ros::NodeHandle private_nh("~");

    try {
        XboxControllerNode xcn(nh, private_nh);
        xcn.run();
    }
    catch(std::runtime_error ex) {
        ROS_ERROR("%s", ex.what());
        return -1;
    }

    return 0;
}


