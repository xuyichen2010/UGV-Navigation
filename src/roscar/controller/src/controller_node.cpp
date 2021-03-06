#include "ros/ros.h"

#include "maestro/MaestroOut.h"
#include "phidget_encoder/Ticks.h"

#include <iostream>

using namespace std;

class ControllerNode {
public:
    ControllerNode(ros::NodeHandle, ros::NodeHandle);
    //~ControllerNode();
    void maestroCallback(const maestro::MaestroOut::ConstPtr&);
    void encoderCallback(const phidget_encoder::Ticks::ConstPtr&);
    void run();

private:
    ros::NodeHandle nh_;
    ros::NodeHandle private_nh_;
    ros::Subscriber readMaestro;
    ros::Subscriber readEncoder;
    double loop_rate_;

    // disable assignment and copy constructor
    ControllerNode& operator=(const ControllerNode&);
    ControllerNode(const ControllerNode&);
};

ControllerNode::ControllerNode(
        ros::NodeHandle nh, 
        ros::NodeHandle private_nh) :
    nh_(nh),
    private_nh_(private_nh)
{
    private_nh_.param("loop_rate", loop_rate_, 10.0);
    //readMaestro = nh_.subscribe("maestro_out", 10, &ControllerNode::maestroCallback, this);
    readEncoder = nh_.subscribe("ticks", 10, &ControllerNode::encoderCallback, this);
}

//ControllerNode::~ControllerNode() {}

void ControllerNode::maestroCallback(const maestro::MaestroOut::ConstPtr& msg) {
    
    //cout << "MAESTRO DATA" << endl;
    //cout << "Maestro Error: " << msg->error << endl;
    //cout << "Drive Position: " << msg->drive_position << endl;
    //cout << "Steering Position: " << msg->steering_position << endl;

}

void ControllerNode::encoderCallback(const phidget_encoder::Ticks::ConstPtr& msg) {

    //cout << "ENCODER DATA" << endl;
    //cout << "Encoder Position: " << msg->position << endl;
    //cout << "Relative Change: " << msg->relative_change << endl;
    //cout << "Elapsed Time: " << msg->elapsed_time << endl;

    double vel = 0;

    if((double)msg->elapsed_time == 0){
        //cout << "Velocity: " << vel << endl;
    }
    else{
        double signConversion = -1;
        double meters = 3.66; //distance taped out and measured
        double ticks = 126213; //empirically measured ten times and averaged
        double secToMs = 1000;
        double mpsToMph = 2.23694;
        const double TICKTOMETER = (signConversion * meters / ticks) * secToMs * mpsToMph; //determined experimentally
        vel = TICKTOMETER * ((double)msg->relative_change / (double)(msg->elapsed_time));
        //cout << "Velocity: " << vel << endl;
    }

    cout << "rel change: " << msg -> relative_change << " elapsed time: " << msg->elapsed_time << endl;
}

void ControllerNode::run() {
    ros::Rate loop_rate(loop_rate_);
    ros::spin();
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "controller");
    ros::NodeHandle nh;
    ros::NodeHandle private_nh("~");

    try {
        ControllerNode cn(nh, private_nh);
        cn.run();
    }
    catch(std::runtime_error ex) {
        ROS_ERROR("%s", ex.what());
        return -1;
    }

    return 0;
}

