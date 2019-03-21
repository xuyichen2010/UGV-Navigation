#include "ros/ros.h"
#include "maestro/VelAndAngle.h"
#include <sensor_msgs/Joy.h>

#include <iostream>

using namespace std;

double throttle = 0;
double turning = 0;
double backup = 0;

void joystickCallback(const sensor_msgs::Joy::ConstPtr& msg){
    throttle = msg->axes[5]; 
    backup = msg->buttons[1];
    turning = msg->axes[0];
    turning *= -1; //account for direction change in PWM
    
    //below if statements map our controller input to usable m/s range for robot
    //if(throttle>=0.1 && throttle<=1.0){
        //start at 0.1 to eliminate noise
        //maps (0.1-1.0) to (0-10)m/s
        //throttle = (throttle-0.1)*11.11;  
    //}

    //maps descending positive range to half of speed range (0-5)m/s
    if(throttle<=1.0 && throttle >=0){
        throttle = (1-throttle)*5;
    }
    else if(throttle<0 && throttle>=(-1.0)){
        throttle = (((-1)*throttle)*5)+5;
    }
    else{
        throttle = 0;
    }
    //maps radio input to rad/s
    if(turning>=0.2 && turning<=1.0){
        turning = (turning-0.2)*3.125;
    }
    else if(turning>=(-1.0) && turning<=(-0.2)){
        turning = (turning+0.2)*3.125;    
    }
    else{
        turning = 0;
    }
    //small reverse for backing up
    if(backup==1){
        throttle = -2;  //will exceed lowest value on lookup table
    }
    
    cout << throttle << "  " << turning << endl;
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "talker");

  ros::NodeHandle n;

  //ros::Publisher converterCommand = n.advertise<maestro::VelAndAngle>("converter_in", 10);
  ros::Subscriber readJoyStick = n.subscribe<sensor_msgs::Joy>("joy",10,joystickCallback);
 
    /*
  maestro::MaestroIn msg;

  double targetSpeed = 2.0;  // in m/s
  double targetAngle = 2.2; //in rad/s

  msg.velocity = targetSpeed;
  msg.angle = targetAngle;

  ros::Duration(0.5).sleep();

  converterCommand.publish(msg);
  cout << "publish 1" << endl;

  cout << "before sleep" << endl;
  ros::Duration(2).sleep(); //sleep for 10 seconds
  cout << "after sleep" << endl;  

  msg.angle = -2.2;
  converterCommand.publish(msg);
  cout << "publish 2" << endl;
    */
/*
    //now publish
    maestro::VelAndAngle msg2;
    msg2.velocity = throttle;
    msg2.angle = turning;
    converterCommand.publish(msg2);
*/

    ros::spin();

  return 0;
}


