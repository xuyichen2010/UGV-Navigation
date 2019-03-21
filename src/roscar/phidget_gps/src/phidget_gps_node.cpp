#include "ros/ros.h"
#include "phidget_gps/PhidgetGPS.h"

class PhidgetGPSNode {
public:
    PhidgetGPSNode(ros::NodeHandle, ros::NodeHandle);
    void run();
private:
    PhidgetGPS pg_;
    ros::NodeHandle nh_;
    ros::NodeHandle private_nh_;
    ros::Publisher out_;
    double loop_rate_;
};

PhidgetGPSNode::PhidgetGPSNode(
        ros::NodeHandle nh,
        ros::NodeHandle private_nh) :
    nh_(nh),
    private_nh_(private_nh)
{
    private_nh_.param("loop_rate", loop_rate_, 10.0);
    out_ = nh_.advertise<phidget_gps::Data>("gps_data", 10);
}

void PhidgetGPSNode::run() {
    ros::Rate loop_rate(loop_rate_);
    while (ros::ok()) {
        phidget_gps::Data data = pg_.getData();
        //ROS_INFO_STREAM(" theta: " <<  data.heading );
        out_.publish(data);
        ros::spinOnce();
        loop_rate.sleep();
    }
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "phidget_gps_node");
    ros::NodeHandle nh;
    ros::NodeHandle private_nh("~");

    try {
        PhidgetGPSNode pgn(nh, private_nh);
        pgn.run();
    }
    catch(std::runtime_error ex) {
        ROS_ERROR("%s", ex.what());
        return -1;
    }

    return 0;
}
