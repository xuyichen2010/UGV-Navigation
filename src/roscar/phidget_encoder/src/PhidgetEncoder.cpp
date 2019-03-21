#include "phidget_encoder/PhidgetEncoder.h"
#include <stdexcept>
#include "ros/ros.h"

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
    std::cerr << "Device OPened" << std::endl;
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
    //std::cout << relative_change_ / elapsed_time_ << std::endl;
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
    
    //std::cerr << "### Position: " << position << ", Relative Change: " << relative_position << ", elasped time: " << time << std::endl;

    return 0;
}
