#include "utm_laser/UtmLaser.h"
#include <stdexcept>
#include "ros/ros.h"

using namespace hokuyo;

UtmLaser::UtmLaser(){
	//! Start angle for the laser scan [rad].  0 is forward and angles are measured clockwise when viewing hokuyo from the top.
    float min_angle = -1.047;
    //! Stop angle for the laser scan [rad].   0 is forward and angles are measured clockwise when viewing hokuyo from the top.
    float max_angle = 1.047;
    //! Scan resolution [rad].
    float ang_increment;
    //! Scan resoltuion [s]
    float time_increment;
    //! Time between scans
    float scan_time;
    //! Minimum range [m]
    float min_range;
    //! Maximum range [m]
    float max_range;
    //! Range Resolution [m]
    float range_res;

	laser = Laser();
	//configure to serial USB port laser connects to
	const char * port_name = "/dev/tty/ACM0";
	laser.open(port_name);
	//try turning on laser
	int result;
	result = laser.laserOn();
	if(result ==  1){
		laser.~Laser();
		throw std::runtime_error("Hokuyo error opening laser");
	}	
}

UtmLaser::~UtmLaser(){
	laser.laserOff();
	laser.~Laser();
}


/*
PhidgetEncoder::PhidgetEncoder() :
    handle_(0)
{
    CPhidgetEncoder_create(&handle_);

    // set up handlers
    CPhidget_set_OnAttach_Handler((CPhidgetHandle)handle_,
            PhidgetEncoder::AttachHandler, NULL);
    CPhidget_set_OnDetach_Handler((CPhidgetHandle)handle_,
            PhidgetEncoder::DetachHandler, NULL);
    CPhidget_set_OnError_Handler((CPhidgetHandle)handle_,
            PhidgetEncoder::ErrorHandler, NULL);
    CPhidgetEncoder_set_OnInputChange_Handler(handle_,
            PhidgetEncoder::InputChangeHandler, NULL);
    CPhidgetEncoder_set_OnPositionChange_Handler(handle_,
            PhidgetEncoder::PositionChangeHandler, NULL);

    // open device
    CPhidget_open((CPhidgetHandle)handle_, -1);
    int result;
    if ((result = CPhidget_waitForAttachment((CPhidgetHandle)handle_, 10000))) {
        const char *err;
        CPhidget_getErrorDescription(result, &err);

        // clean up
        CPhidget_close((CPhidgetHandle)handle_);
        CPhidget_delete((CPhidgetHandle)handle_);

        throw std::runtime_error(err);
    }
}

PhidgetEncoder::~PhidgetEncoder() {
    CPhidget_close((CPhidgetHandle)handle_);
    CPhidget_delete((CPhidgetHandle)handle_);
}

phidget_encoder::Ticks PhidgetEncoder::getTicks() {
    boost::mutex::scoped_lock lock(lock_);
    phidget_encoder::Ticks ticks;
    ticks.header.stamp = ros::Time::now();
    ticks.position = position_;
    ticks.relative_change = relative_change_;
    ticks.elapsed_time = elapsed_time_;

    // reset
    {
        relative_change_ = 0;
        elapsed_time_ = 0;
    }

    return ticks;
}

int PhidgetEncoder::AttachHandler(CPhidgetHandle handle, void* useptr) {
    int serial_number;
    CPhidget_getSerialNumber(handle, &serial_number);
    ROS_INFO("Encoder %10d attached", serial_number);

    return 0;
}

int PhidgetEncoder::DetachHandler(CPhidgetHandle handle, void* useptr) {
    int serial_number;
    CPhidget_getSerialNumber(handle, &serial_number);
    ROS_INFO("Encoder %10d detached", serial_number);

    return 0;
}

int PhidgetEncoder::ErrorHandler(CPhidgetHandle handle,
        void* useptr, int error_code, const char *description) {
    ROS_ERROR("Phidget Error: %i - %s", error_code, description);

    return 0;
}

int PhidgetEncoder::InputChangeHandler(CPhidgetEncoderHandle handle,
        void* useptr, int index, int state) {
    ROS_INFO("Input #%i - State:%i", index, state);

    return 0;
}

int PhidgetEncoder::PositionChangeHandler(CPhidgetEncoderHandle handle,
        void* useptr, int index, int time, int relative_position) {
    boost::mutex::scoped_lock(lock_);
    int position;
    CPhidgetEncoder_getPosition(handle, index, &position);
    position_ = position;
    relative_change_ += relative_position;
    elapsed_time_ += time;

    return 0;
}

*/
