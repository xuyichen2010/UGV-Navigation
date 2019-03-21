// Auto-generated. Do not edit!

// (in-package utm_laser.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Laser {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.Target_Easting = null;
      this.Target_Northing = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('Target_Easting')) {
        this.Target_Easting = initObj.Target_Easting
      }
      else {
        this.Target_Easting = 0.0;
      }
      if (initObj.hasOwnProperty('Target_Northing')) {
        this.Target_Northing = initObj.Target_Northing
      }
      else {
        this.Target_Northing = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Laser
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [Target_Easting]
    bufferOffset = _serializer.float64(obj.Target_Easting, buffer, bufferOffset);
    // Serialize message field [Target_Northing]
    bufferOffset = _serializer.float64(obj.Target_Northing, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Laser
    let len;
    let data = new Laser(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [Target_Easting]
    data.Target_Easting = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Target_Northing]
    data.Target_Northing = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'utm_laser/Laser';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd3ef403ce43b03eb3ad99eeb89714ea8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float64 Target_Easting
    float64 Target_Northing
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Laser(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.Target_Easting !== undefined) {
      resolved.Target_Easting = msg.Target_Easting;
    }
    else {
      resolved.Target_Easting = 0.0
    }

    if (msg.Target_Northing !== undefined) {
      resolved.Target_Northing = msg.Target_Northing;
    }
    else {
      resolved.Target_Northing = 0.0
    }

    return resolved;
    }
};

module.exports = Laser;
