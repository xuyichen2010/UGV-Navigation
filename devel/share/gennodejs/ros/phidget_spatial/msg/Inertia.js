// Auto-generated. Do not edit!

// (in-package phidget_spatial.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Inertia {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.timeSecs = null;
      this.timeMicroSecs = null;
      this.xAccel = null;
      this.yAccel = null;
      this.zAccel = null;
      this.xAngular = null;
      this.yAngular = null;
      this.zAngular = null;
      this.xMagField = null;
      this.yMagField = null;
      this.zMagField = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('timeSecs')) {
        this.timeSecs = initObj.timeSecs
      }
      else {
        this.timeSecs = 0.0;
      }
      if (initObj.hasOwnProperty('timeMicroSecs')) {
        this.timeMicroSecs = initObj.timeMicroSecs
      }
      else {
        this.timeMicroSecs = 0.0;
      }
      if (initObj.hasOwnProperty('xAccel')) {
        this.xAccel = initObj.xAccel
      }
      else {
        this.xAccel = 0.0;
      }
      if (initObj.hasOwnProperty('yAccel')) {
        this.yAccel = initObj.yAccel
      }
      else {
        this.yAccel = 0.0;
      }
      if (initObj.hasOwnProperty('zAccel')) {
        this.zAccel = initObj.zAccel
      }
      else {
        this.zAccel = 0.0;
      }
      if (initObj.hasOwnProperty('xAngular')) {
        this.xAngular = initObj.xAngular
      }
      else {
        this.xAngular = 0.0;
      }
      if (initObj.hasOwnProperty('yAngular')) {
        this.yAngular = initObj.yAngular
      }
      else {
        this.yAngular = 0.0;
      }
      if (initObj.hasOwnProperty('zAngular')) {
        this.zAngular = initObj.zAngular
      }
      else {
        this.zAngular = 0.0;
      }
      if (initObj.hasOwnProperty('xMagField')) {
        this.xMagField = initObj.xMagField
      }
      else {
        this.xMagField = 0.0;
      }
      if (initObj.hasOwnProperty('yMagField')) {
        this.yMagField = initObj.yMagField
      }
      else {
        this.yMagField = 0.0;
      }
      if (initObj.hasOwnProperty('zMagField')) {
        this.zMagField = initObj.zMagField
      }
      else {
        this.zMagField = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Inertia
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [timeSecs]
    bufferOffset = _serializer.float64(obj.timeSecs, buffer, bufferOffset);
    // Serialize message field [timeMicroSecs]
    bufferOffset = _serializer.float64(obj.timeMicroSecs, buffer, bufferOffset);
    // Serialize message field [xAccel]
    bufferOffset = _serializer.float64(obj.xAccel, buffer, bufferOffset);
    // Serialize message field [yAccel]
    bufferOffset = _serializer.float64(obj.yAccel, buffer, bufferOffset);
    // Serialize message field [zAccel]
    bufferOffset = _serializer.float64(obj.zAccel, buffer, bufferOffset);
    // Serialize message field [xAngular]
    bufferOffset = _serializer.float64(obj.xAngular, buffer, bufferOffset);
    // Serialize message field [yAngular]
    bufferOffset = _serializer.float64(obj.yAngular, buffer, bufferOffset);
    // Serialize message field [zAngular]
    bufferOffset = _serializer.float64(obj.zAngular, buffer, bufferOffset);
    // Serialize message field [xMagField]
    bufferOffset = _serializer.float64(obj.xMagField, buffer, bufferOffset);
    // Serialize message field [yMagField]
    bufferOffset = _serializer.float64(obj.yMagField, buffer, bufferOffset);
    // Serialize message field [zMagField]
    bufferOffset = _serializer.float64(obj.zMagField, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Inertia
    let len;
    let data = new Inertia(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [timeSecs]
    data.timeSecs = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [timeMicroSecs]
    data.timeMicroSecs = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [xAccel]
    data.xAccel = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yAccel]
    data.yAccel = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [zAccel]
    data.zAccel = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [xAngular]
    data.xAngular = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yAngular]
    data.yAngular = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [zAngular]
    data.zAngular = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [xMagField]
    data.xMagField = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yMagField]
    data.yMagField = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [zMagField]
    data.zMagField = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 88;
  }

  static datatype() {
    // Returns string type for a message object
    return 'phidget_spatial/Inertia';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '25b07e6d95874255a426afc6f666ece0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float64 timeSecs
    float64 timeMicroSecs
    float64 xAccel
    float64 yAccel
    float64 zAccel
    float64 xAngular
    float64 yAngular
    float64 zAngular
    float64 xMagField
    float64 yMagField
    float64 zMagField
    
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
    const resolved = new Inertia(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.timeSecs !== undefined) {
      resolved.timeSecs = msg.timeSecs;
    }
    else {
      resolved.timeSecs = 0.0
    }

    if (msg.timeMicroSecs !== undefined) {
      resolved.timeMicroSecs = msg.timeMicroSecs;
    }
    else {
      resolved.timeMicroSecs = 0.0
    }

    if (msg.xAccel !== undefined) {
      resolved.xAccel = msg.xAccel;
    }
    else {
      resolved.xAccel = 0.0
    }

    if (msg.yAccel !== undefined) {
      resolved.yAccel = msg.yAccel;
    }
    else {
      resolved.yAccel = 0.0
    }

    if (msg.zAccel !== undefined) {
      resolved.zAccel = msg.zAccel;
    }
    else {
      resolved.zAccel = 0.0
    }

    if (msg.xAngular !== undefined) {
      resolved.xAngular = msg.xAngular;
    }
    else {
      resolved.xAngular = 0.0
    }

    if (msg.yAngular !== undefined) {
      resolved.yAngular = msg.yAngular;
    }
    else {
      resolved.yAngular = 0.0
    }

    if (msg.zAngular !== undefined) {
      resolved.zAngular = msg.zAngular;
    }
    else {
      resolved.zAngular = 0.0
    }

    if (msg.xMagField !== undefined) {
      resolved.xMagField = msg.xMagField;
    }
    else {
      resolved.xMagField = 0.0
    }

    if (msg.yMagField !== undefined) {
      resolved.yMagField = msg.yMagField;
    }
    else {
      resolved.yMagField = 0.0
    }

    if (msg.zMagField !== undefined) {
      resolved.zMagField = msg.zMagField;
    }
    else {
      resolved.zMagField = 0.0
    }

    return resolved;
    }
};

module.exports = Inertia;
