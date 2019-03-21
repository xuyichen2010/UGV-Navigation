#include <ros/ros.h>

#include <geometry_msgs/Pose.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>
#include <geometry_msgs/Twist.h>
#include <nav_msgs/Odometry.h>

#include <tf/tf.h>
#include <tf/transform_broadcaster.h>

////////////////////////////////////////////////////////////////////////////////
class RosCar {
    public:
        RosCar();
        geometry_msgs::Pose getPose();
        void setPose(geometry_msgs::Pose pose);
        void projectMotion(double v, double omega, double dt);
    private:
        double poseX_;
        double poseY_;
        double poseTheta_;
};

RosCar::RosCar() :
    poseX_(0.0),
    poseY_(0.0),
    poseTheta_(0.0)
{}

geometry_msgs::Pose RosCar::getPose() {
    geometry_msgs::Pose result;

    result.position.x = this->poseX_;
    result.position.y = this->poseY_;
    result.position.z = 0.0;

    tf::Quaternion q = tf::createQuaternionFromYaw(this->poseTheta_);
    result.orientation.x = q.x();
    result.orientation.y = q.y();
    result.orientation.z = q.z();
    result.orientation.w = q.w();

    return result;
}

void RosCar::setPose(geometry_msgs::Pose pose) {
    this->poseX_ = pose.position.x;
    this->poseY_ = pose.position.y;
    this->poseTheta_ = tf::getYaw(pose.orientation);
}

void RosCar::projectMotion(double v, double omega, double dt) {
    this->poseX_ = this->poseX_ + v * cos(this->poseTheta_) * dt;
    this->poseY_ = this->poseY_ + v * sin(this->poseTheta_) * dt;
    this->poseTheta_ = this->poseTheta_ + omega * dt;
}

////////////////////////////////////////////////////////////////////////////////
class RosCarSimulator {
    public:
        RosCarSimulator(ros::NodeHandle nh);
        void commandCallback(const geometry_msgs::Twist& command);
        void initialPoseCallback(
                const geometry_msgs::PoseWithCovarianceStamped& initial_pose);
    private:
        void loop();

        ros::NodeHandle nh_;
        ros::NodeHandle private_nh_;

        ros::Subscriber command_sub_;
        ros::Subscriber initial_pose_sub_;
        ros::Publisher odometry_pub_;
        tf::TransformBroadcaster tfb_;

        geometry_msgs::Twist current_command_;

        RosCar roscar_;
};

RosCarSimulator::RosCarSimulator(ros::NodeHandle nh) :
    nh_(nh), private_nh_("~")
{
    // publishers and subscribers
    this->odometry_pub_ = this->nh_.advertise<nav_msgs::Odometry>("/odom", 50);
    this->initial_pose_sub_ = this->nh_.subscribe("/initialpose", 10,
            &RosCarSimulator::initialPoseCallback, this);
    this->command_sub_ = this->nh_.subscribe("/cmd_vel", 10,
            &RosCarSimulator::commandCallback, this);

    ROS_INFO("Entering run loop");
    this->loop();
}

void RosCarSimulator::commandCallback(const geometry_msgs::Twist& command) {
    this->current_command_ = command;
}

void RosCarSimulator::initialPoseCallback(
        const geometry_msgs::PoseWithCovarianceStamped& initial_pose) {
    ROS_INFO("Got pose: (%f, %f)", initial_pose.pose.pose.position.x,
            initial_pose.pose.pose.position.y);

    // transform real robot to world frame
    this->roscar_.setPose(initial_pose.pose.pose);
    geometry_msgs::Pose p1 = this->roscar_.getPose();
    ROS_INFO("Real: (%f, %f)", p1.position.x, p1.position.y);
}

void RosCarSimulator::loop() {
    ros::Rate loop_rate(15);
    ros::Time t_minus_1 = ros::Time::now();
    int i = 0;
    while(ros::ok()) {
        ros::Time t = ros::Time::now();

        double v = this->current_command_.linear.x;
        double omega = this->current_command_.angular.z;
        double dt = (t - t_minus_1).toSec();

        // send command to real chair
        this->roscar_.projectMotion(v, omega, dt);

        // publish odom tf and odometry msg based on noisy chair
        geometry_msgs::Pose pose = this->roscar_.getPose();

        nav_msgs::Odometry odometry_msg;
        odometry_msg.header.stamp = t;
        odometry_msg.header.frame_id = "/odom";
        odometry_msg.child_frame_id = "/base_link";
        odometry_msg.pose.pose = pose;
        odometry_msg.twist.twist.linear.x = v;
        odometry_msg.twist.twist.angular.z = omega;
        this->odometry_pub_.publish(odometry_msg);

        geometry_msgs::TransformStamped tfs;
        tfs.header = odometry_msg.header;
        tfs.child_frame_id = odometry_msg.child_frame_id;
        tfs.transform.translation.x = pose.position.x;
        tfs.transform.translation.y = pose.position.y;
        tfs.transform.translation.z = pose.position.z;
        tfs.transform.rotation = pose.orientation;
        this->tfb_.sendTransform(tfs);

        t_minus_1 = t;
        ros::spinOnce();
        loop_rate.sleep();
    }
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "roscar_simulator");
    ros::NodeHandle n;

    RosCarSimulator ws(n);

    return 0;
}
