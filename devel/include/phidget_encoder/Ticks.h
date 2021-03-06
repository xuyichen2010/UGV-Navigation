// Generated by gencpp from file phidget_encoder/Ticks.msg
// DO NOT EDIT!


#ifndef PHIDGET_ENCODER_MESSAGE_TICKS_H
#define PHIDGET_ENCODER_MESSAGE_TICKS_H


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
struct Ticks_
{
  typedef Ticks_<ContainerAllocator> Type;

  Ticks_()
    : header()
    , position(0)
    , relative_change(0)
    , elapsed_time(0)  {
    }
  Ticks_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , position(0)
    , relative_change(0)
    , elapsed_time(0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef int64_t _position_type;
  _position_type position;

   typedef int64_t _relative_change_type;
  _relative_change_type relative_change;

   typedef int64_t _elapsed_time_type;
  _elapsed_time_type elapsed_time;





  typedef boost::shared_ptr< ::phidget_encoder::Ticks_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::phidget_encoder::Ticks_<ContainerAllocator> const> ConstPtr;

}; // struct Ticks_

typedef ::phidget_encoder::Ticks_<std::allocator<void> > Ticks;

typedef boost::shared_ptr< ::phidget_encoder::Ticks > TicksPtr;
typedef boost::shared_ptr< ::phidget_encoder::Ticks const> TicksConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::phidget_encoder::Ticks_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::phidget_encoder::Ticks_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace phidget_encoder

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'phidget_encoder': ['/home/nuccar/roscar_2018/src/roscar/phidget_encoder/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::phidget_encoder::Ticks_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::phidget_encoder::Ticks_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::phidget_encoder::Ticks_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::phidget_encoder::Ticks_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::phidget_encoder::Ticks_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::phidget_encoder::Ticks_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::phidget_encoder::Ticks_<ContainerAllocator> >
{
  static const char* value()
  {
    return "77d9a9cff4b2322ae71df049c436273f";
  }

  static const char* value(const ::phidget_encoder::Ticks_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x77d9a9cff4b2322aULL;
  static const uint64_t static_value2 = 0xe71df049c436273fULL;
};

template<class ContainerAllocator>
struct DataType< ::phidget_encoder::Ticks_<ContainerAllocator> >
{
  static const char* value()
  {
    return "phidget_encoder/Ticks";
  }

  static const char* value(const ::phidget_encoder::Ticks_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::phidget_encoder::Ticks_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n\
int64 position\n\
int64 relative_change\n\
int64 elapsed_time\n\
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

  static const char* value(const ::phidget_encoder::Ticks_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::phidget_encoder::Ticks_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.position);
      stream.next(m.relative_change);
      stream.next(m.elapsed_time);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Ticks_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::phidget_encoder::Ticks_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::phidget_encoder::Ticks_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "position: ";
    Printer<int64_t>::stream(s, indent + "  ", v.position);
    s << indent << "relative_change: ";
    Printer<int64_t>::stream(s, indent + "  ", v.relative_change);
    s << indent << "elapsed_time: ";
    Printer<int64_t>::stream(s, indent + "  ", v.elapsed_time);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PHIDGET_ENCODER_MESSAGE_TICKS_H
