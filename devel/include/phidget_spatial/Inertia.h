// Generated by gencpp from file phidget_spatial/Inertia.msg
// DO NOT EDIT!


#ifndef PHIDGET_SPATIAL_MESSAGE_INERTIA_H
#define PHIDGET_SPATIAL_MESSAGE_INERTIA_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace phidget_spatial
{
template <class ContainerAllocator>
struct Inertia_
{
  typedef Inertia_<ContainerAllocator> Type;

  Inertia_()
    : header()
    , timeSecs(0.0)
    , timeMicroSecs(0.0)
    , xAccel(0.0)
    , yAccel(0.0)
    , zAccel(0.0)
    , xAngular(0.0)
    , yAngular(0.0)
    , zAngular(0.0)
    , xMagField(0.0)
    , yMagField(0.0)
    , zMagField(0.0)  {
    }
  Inertia_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , timeSecs(0.0)
    , timeMicroSecs(0.0)
    , xAccel(0.0)
    , yAccel(0.0)
    , zAccel(0.0)
    , xAngular(0.0)
    , yAngular(0.0)
    , zAngular(0.0)
    , xMagField(0.0)
    , yMagField(0.0)
    , zMagField(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef double _timeSecs_type;
  _timeSecs_type timeSecs;

   typedef double _timeMicroSecs_type;
  _timeMicroSecs_type timeMicroSecs;

   typedef double _xAccel_type;
  _xAccel_type xAccel;

   typedef double _yAccel_type;
  _yAccel_type yAccel;

   typedef double _zAccel_type;
  _zAccel_type zAccel;

   typedef double _xAngular_type;
  _xAngular_type xAngular;

   typedef double _yAngular_type;
  _yAngular_type yAngular;

   typedef double _zAngular_type;
  _zAngular_type zAngular;

   typedef double _xMagField_type;
  _xMagField_type xMagField;

   typedef double _yMagField_type;
  _yMagField_type yMagField;

   typedef double _zMagField_type;
  _zMagField_type zMagField;





  typedef boost::shared_ptr< ::phidget_spatial::Inertia_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::phidget_spatial::Inertia_<ContainerAllocator> const> ConstPtr;

}; // struct Inertia_

typedef ::phidget_spatial::Inertia_<std::allocator<void> > Inertia;

typedef boost::shared_ptr< ::phidget_spatial::Inertia > InertiaPtr;
typedef boost::shared_ptr< ::phidget_spatial::Inertia const> InertiaConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::phidget_spatial::Inertia_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::phidget_spatial::Inertia_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace phidget_spatial

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'phidget_spatial': ['/home/nuccar/roscar_2018/src/roscar/phidget_spatial/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::phidget_spatial::Inertia_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::phidget_spatial::Inertia_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::phidget_spatial::Inertia_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::phidget_spatial::Inertia_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::phidget_spatial::Inertia_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::phidget_spatial::Inertia_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::phidget_spatial::Inertia_<ContainerAllocator> >
{
  static const char* value()
  {
    return "25b07e6d95874255a426afc6f666ece0";
  }

  static const char* value(const ::phidget_spatial::Inertia_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x25b07e6d95874255ULL;
  static const uint64_t static_value2 = 0xa426afc6f666ece0ULL;
};

template<class ContainerAllocator>
struct DataType< ::phidget_spatial::Inertia_<ContainerAllocator> >
{
  static const char* value()
  {
    return "phidget_spatial/Inertia";
  }

  static const char* value(const ::phidget_spatial::Inertia_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::phidget_spatial::Inertia_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n\
float64 timeSecs\n\
float64 timeMicroSecs\n\
float64 xAccel\n\
float64 yAccel\n\
float64 zAccel\n\
float64 xAngular\n\
float64 yAngular\n\
float64 zAngular\n\
float64 xMagField\n\
float64 yMagField\n\
float64 zMagField\n\
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

  static const char* value(const ::phidget_spatial::Inertia_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::phidget_spatial::Inertia_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.timeSecs);
      stream.next(m.timeMicroSecs);
      stream.next(m.xAccel);
      stream.next(m.yAccel);
      stream.next(m.zAccel);
      stream.next(m.xAngular);
      stream.next(m.yAngular);
      stream.next(m.zAngular);
      stream.next(m.xMagField);
      stream.next(m.yMagField);
      stream.next(m.zMagField);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Inertia_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::phidget_spatial::Inertia_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::phidget_spatial::Inertia_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "timeSecs: ";
    Printer<double>::stream(s, indent + "  ", v.timeSecs);
    s << indent << "timeMicroSecs: ";
    Printer<double>::stream(s, indent + "  ", v.timeMicroSecs);
    s << indent << "xAccel: ";
    Printer<double>::stream(s, indent + "  ", v.xAccel);
    s << indent << "yAccel: ";
    Printer<double>::stream(s, indent + "  ", v.yAccel);
    s << indent << "zAccel: ";
    Printer<double>::stream(s, indent + "  ", v.zAccel);
    s << indent << "xAngular: ";
    Printer<double>::stream(s, indent + "  ", v.xAngular);
    s << indent << "yAngular: ";
    Printer<double>::stream(s, indent + "  ", v.yAngular);
    s << indent << "zAngular: ";
    Printer<double>::stream(s, indent + "  ", v.zAngular);
    s << indent << "xMagField: ";
    Printer<double>::stream(s, indent + "  ", v.xMagField);
    s << indent << "yMagField: ";
    Printer<double>::stream(s, indent + "  ", v.yMagField);
    s << indent << "zMagField: ";
    Printer<double>::stream(s, indent + "  ", v.zMagField);
  }
};

} // namespace message_operations
} // namespace ros

#endif // PHIDGET_SPATIAL_MESSAGE_INERTIA_H
