#include "ros/ros.h"
#include "maestro/MaestroIn.h"

#include <iostream>

using namespace std;

int main(int argc, char **argv)
{
  ros::init(argc, argv, "PW_publisher");

  ros::NodeHandle n;

  ros::Publisher maestroCommand = n.advertise<maestro::MaestroIn>("maestro_in", 10);
 
  maestro::MaestroIn msg;

  double targetSpeed = 5000;
  double targetAngle = 4000; 

  double speedLim = 7225;
  double angLim = 8025;

  while(targetSpeed < speedLim || targetAngle < angLim){

    msg.drive_position = targetSpeed;
    msg.steering_position = targetAngle;

    ros::Duration(0.5).sleep();
    maestroCommand.publish(msg);

    if (targetSpeed < speedLim){
        targetSpeed = targetSpeed + 25;
    }
    else{
        targetSpeed = 0;
    }
    if (targetAngle < angLim){
        targetAngle = targetAngle + 25;
    }
    else{
        targetAngle = 0;
    }
    ros::Duration(1).sleep();
  }

  msg.drive_position = 0;
  msg.steering_position = 0;
  maestroCommand.publish(msg);
  cout << "publish 3" << endl;
  maestroCommand.publish(msg);
  maestroCommand.publish(msg);

  return 0;
}
