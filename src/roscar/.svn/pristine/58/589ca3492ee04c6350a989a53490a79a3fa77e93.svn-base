#include "ros/ros.h"
#include "maestro/VelAndAngle.h"
#include "maestro/MaestroIn.h"

#include <iostream>

using namespace std;

int main(int argc, char **argv){
  ros::init(argc, argv, "talker");

  ros::NodeHandle n;

  int targetAngVel_;

  n.param("targetAngVel", targetAngVel_, 6000);

  //ros::Publisher converterCommand = n.advertise<maestro::VelAndAngle>("converter_in", 10);
  ros::Publisher maestroCommand = n.advertise<maestro::MaestroIn>("maestro_in", 10);
 
  //maestro::VelAndAngle msg;
  maestro::MaestroIn msg;

  double targetSpeed = 6650;  // in m/s
  double targetAngle = 6000;

  msg.drive_position = targetSpeed;
  msg.steering_position = targetAngle;

  ros::Duration(3).sleep();

  maestroCommand.publish(msg);
  cout << "publish 1" << endl;

  cout << "before sleep" << endl;
  ros::Duration(15).sleep(); //sleep for 10 seconds
  cout << "after sleep" << endl;  

  msg.drive_position = 0;
  msg.steering_position = 0;
  cout << "publish 3" << endl;
  int count = 0;
  while(count < 10000){
    maestroCommand.publish(msg);
    count++;
  }

  return 0;
}
