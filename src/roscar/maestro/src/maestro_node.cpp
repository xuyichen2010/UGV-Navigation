#include "ros/ros.h"

#include "maestro/Maestro.h"
#include "maestro/MaestroOut.h"
#include "maestro/MaestroIn.h"

class MaestroNode {
public:
    MaestroNode(ros::NodeHandle, ros::NodeHandle);
    ~MaestroNode();
    void callback(const maestro::MaestroIn::ConstPtr&);
    void run();
private:
    ros::NodeHandle nh_;
    ros::NodeHandle private_nh_;
    ros::Publisher out_;
    ros::Subscriber in_;
    Maestro* m_;
    double loop_rate_;
    double drive_change_rate_;
    double steer_change_rate_;

    // disable assignment and copy constructor
    MaestroNode& operator=(const MaestroNode&);
    MaestroNode(const MaestroNode&);
};

MaestroNode::MaestroNode(
        ros::NodeHandle nh, 
        ros::NodeHandle private_nh) :
    nh_(nh),
    private_nh_(private_nh)
{

   
    out_ = nh_.advertise<maestro::MaestroOut>("maestro_out", 10);
    in_ = nh_.subscribe("maestro_in", 10, &MaestroNode::callback, this);

    std::string device;
    int drive_channel;
    int steering_channel;
    private_nh_.param("device", device, std::string("/dev/ttyACM0"));
    private_nh_.param("drive_channel", drive_channel, 3);
    private_nh_.param("steering_channel", steering_channel, 1);
    private_nh_.param("loop_rate", loop_rate_, 10.0);
    private_nh_.param("drive_change_rate", drive_change_rate_, 90.0); //used to be 90
    private_nh_.param("steer_change_rate", steer_change_rate_, 500.0);
    
        
    m_ = new Maestro(device, (uint8_t)drive_channel, (uint8_t)steering_channel);



    //set the change rates of the maestro

    //fprintf(stderr, "Drive Position is \n");
    m_->setSteerChangeRate(steer_change_rate_);
    m_->setDriveChangeRate(drive_change_rate_);
    m_->goHome();
}

MaestroNode::~MaestroNode() {
    //m_->goHome();
    delete m_;
}

void MaestroNode::callback(const maestro::MaestroIn::ConstPtr& msg) {
	//fprintf(stderr, "being called back\n");
	//fprintf(stderr, "Maestro\n");
	//fprintf(stderr, "	Maestro_Velocity: %i.\n", msg->drive_position);
	//fprintf(stderr, "	Maestro_Angle: %i.\n\n", msg->steering_position); 
	
    m_->setDrivePosition(msg->drive_position);
    m_->setSteeringPosition(msg->steering_position);


}

void MaestroNode::run() {
	
    ros::Rate loop_rate(loop_rate_);
	
    while (ros::ok()) { 
        int error = m_->getError();
        int drive_position = m_->getDrivePosition();
        int steering_position = m_->getSteeringPosition();

		maestro::MaestroOut mo;
        mo.error = error;
        mo.drive_position = drive_position;
        mo.steering_position = steering_position;
 	//m_->setDrivePosition(5500);
    	//m_->setSteeringPosition(4800);
	//fprintf(stderr, "Drive Position is %d.\n", drive_position);
	//fprintf(stderr, "Steering Position is %d.\n", steering_position); 

        double currTime = ros::Time::now().toSec();
        mo.currTime = currTime;

        out_.publish(mo);
        
        ros::spinOnce();
        loop_rate.sleep();
    }
}

int main(int argc, char** argv) {
    ros::init(argc, argv, "maestro");
    ros::NodeHandle nh;
    ros::NodeHandle private_nh("~");

    try {
        MaestroNode mn(nh, private_nh);

        mn.run();
    }
    catch(std::runtime_error ex) {
        ROS_ERROR("%s", ex.what());
        return -1;
    }

    return 0;
}
