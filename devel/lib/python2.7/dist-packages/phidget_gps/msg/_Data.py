# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from phidget_gps/Data.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import std_msgs.msg

class Data(genpy.Message):
  _md5sum = "29c11ca0677b8b655fe476d7ca3ebb6b"
  _type = "phidget_gps/Data"
  _has_header = True #flag to mark the presence of a Header object
  _full_text = """Header header
bool fix_status
float64 latitude
float64 longitude
float64 altitude
bool is_velocity_valid
float64 velocity
bool is_heading_valid
float64 heading

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id
"""
  __slots__ = ['header','fix_status','latitude','longitude','altitude','is_velocity_valid','velocity','is_heading_valid','heading']
  _slot_types = ['std_msgs/Header','bool','float64','float64','float64','bool','float64','bool','float64']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,fix_status,latitude,longitude,altitude,is_velocity_valid,velocity,is_heading_valid,heading

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Data, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.fix_status is None:
        self.fix_status = False
      if self.latitude is None:
        self.latitude = 0.
      if self.longitude is None:
        self.longitude = 0.
      if self.altitude is None:
        self.altitude = 0.
      if self.is_velocity_valid is None:
        self.is_velocity_valid = False
      if self.velocity is None:
        self.velocity = 0.
      if self.is_heading_valid is None:
        self.is_heading_valid = False
      if self.heading is None:
        self.heading = 0.
    else:
      self.header = std_msgs.msg.Header()
      self.fix_status = False
      self.latitude = 0.
      self.longitude = 0.
      self.altitude = 0.
      self.is_velocity_valid = False
      self.velocity = 0.
      self.is_heading_valid = False
      self.heading = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_B3dBdBd().pack(_x.fix_status, _x.latitude, _x.longitude, _x.altitude, _x.is_velocity_valid, _x.velocity, _x.is_heading_valid, _x.heading))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 43
      (_x.fix_status, _x.latitude, _x.longitude, _x.altitude, _x.is_velocity_valid, _x.velocity, _x.is_heading_valid, _x.heading,) = _get_struct_B3dBdBd().unpack(str[start:end])
      self.fix_status = bool(self.fix_status)
      self.is_velocity_valid = bool(self.is_velocity_valid)
      self.is_heading_valid = bool(self.is_heading_valid)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_get_struct_B3dBdBd().pack(_x.fix_status, _x.latitude, _x.longitude, _x.altitude, _x.is_velocity_valid, _x.velocity, _x.is_heading_valid, _x.heading))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 43
      (_x.fix_status, _x.latitude, _x.longitude, _x.altitude, _x.is_velocity_valid, _x.velocity, _x.is_heading_valid, _x.heading,) = _get_struct_B3dBdBd().unpack(str[start:end])
      self.fix_status = bool(self.fix_status)
      self.is_velocity_valid = bool(self.is_velocity_valid)
      self.is_heading_valid = bool(self.is_heading_valid)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_B3dBdBd = None
def _get_struct_B3dBdBd():
    global _struct_B3dBdBd
    if _struct_B3dBdBd is None:
        _struct_B3dBdBd = struct.Struct("<B3dBdBd")
    return _struct_B3dBdBd
