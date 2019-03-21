// Generated by gencpp from file phidget_encoder/Speed.msg
// DO NOT EDIT!


#ifndef PHIDGET_ENCODER_MESSAGE_SPEED_H
#define PHIDGET_ENCODER_MESSAGE_SPEED_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace phidget_encoder
{
template <class ContainerAllocator>
struct Speed_
{
  typedef Speed_<ContainerAllocator> Type;

  Speed_()
    : header()
    , velocity(0)  {
    }
  Speed_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , velocity(0)  {
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef int64_t _velocity_type;
  _velocity_type velocity;




  typedef boost::shared_ptr< ::phidget_encoder::Speed_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::phidget_encoder::Speed_<ContainerAllocator> const> ConstPtr;

}; // struct Speed_

typedef ::phidget_encoder::Speed_<std::allocator<void> > Speed;

typedef boost::shared_ptr< ::phidget_encoder::Speed > SpeedPtr;
typedef boost::shared_ptr< ::phidget_encoder::Speed const> SpeedConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::phidget_encoder::Speed_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::phidget_encoder::Speed_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace phidget_encoder

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'std_msgs': ['/opt/ros/jade/share/std_msgs/cmake/../msg'], 'phidget_encoder': ['/home/nuccar/roscar_ws/src/roscar/phidget_encoder/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::phidget_encoder::Speed_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::phidget_encoder::Speed_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::phidget_encoder::Speed_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::phidget_encoder::Speed_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::phidget_encoder::Speed_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::phidget_encoder::Speed_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::phidget_encoder::Speed_<ContainerAllocator> >
{
  static const char* value()
  {
    return "dc4f1ff0648492c35aad7a050899d653";
  }

  static const char* value(const ::phidget_encoder::Speed_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xdc4f1ff0648492c3ULL;
  static const uint64_t static_value2 = 0x5aad7a050899d653ULL;
};

template<class ContainerAllocator>
struct DataType< ::phidget_encoder::Speed_<ContainerAllocator> >
{
  static const char* value()
  {
    return "phidget_encoder/Speed";
  }

  static const char* value(const ::phidget_encoder::Speed_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::phidget_encoder::Speed_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n\
int64 velocity\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
";
  }

  static const char* value(const ::phidget_encoder::Speed_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::phidget_encoder::Speed_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.velocity);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct Speed_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::phidget_encoder::Speed_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::phidget_encoder::Speed_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "velocity: ";
    Printer<int64_t>::stream(s, indent + "  ", v.velocity);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PHIDGET_ENCODER_MESSAGE_SPEED_H
