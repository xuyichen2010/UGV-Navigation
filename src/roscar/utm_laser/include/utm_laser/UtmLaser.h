#ifndef UTM_LASER_H
#define UTM_LASER_H

#include <hokuyo_node/hokuyo.h>
#include "utm_laser/Laser.h"
#include "utm_laser/Calibration.h"
#include <boost/thread/mutex.hpp>
#include "ros/ros.h"
#include <sensor_msgs/LaserScan.h>
//Define member variables

class UtmLaser {

	
public:
	UtmLaser(ros::NodeHandle, ros::NodeHandle);
	void laserCallback(const sensor_msgs::LaserScan::ConstPtr& msg);
	utm_laser::Laser getTargetCoords();
	utm_laser::Calibration getExpData();
	void run();

	struct Rectangular_Coords{
		double Northing;
		double Easting;
	};

	double lerp(double start1, double end1, double x, double start2, double end2);
	double distance(double x1, double y1, double x2, double y2);


private:
	ros::NodeHandle nh_;
    	ros::NodeHandle private_nh_;
    	ros::Subscriber readLaser;
	ros::Publisher pushTargetCoords;
	ros::Publisher calibrationTest;
	ros::Publisher thresholdPoints;
	ros::Publisher intensityFilter;
	double loop_rate_;
	boost::mutex lock_;

	//parameters
	double PERCENTAGE_THRESHOLD;
	double TARGET_MAX_CHANGE;
	double MIN_DETECTION_WIDTH;
	double MAX_DETECTION_WIDTH;

	double last_sensor_target_x;
	double last_sensor_target_y;
	bool newTarget;
	double lastTime;
	double Northing;
	double Easting;

	//experiment members
	double med_range;
	double med_intensity;

	// disable assignment and copy constructor
    	UtmLaser& operator=(const UtmLaser&);
    	UtmLaser(const UtmLaser&);

	Rectangular_Coords polarToRectangular(double radius, double theta);
	double calcMedian(std::vector<double> scores);

 };

#endif // UTM_LASER_H
