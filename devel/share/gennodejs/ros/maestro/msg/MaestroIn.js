// Auto-generated. Do not edit!

// (in-package maestro.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class MaestroIn {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.drive_position = null;
      this.steering_position = null;
    }
    else {
      if (initObj.hasOwnProperty('drive_position')) {
        this.drive_position = initObj.drive_position
      }
      else {
        this.drive_position = 0;
      }
      if (initObj.hasOwnProperty('steering_position')) {
        this.steering_position = initObj.steering_position
      }
      else {
        this.steering_position = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MaestroIn
    // Serialize message field [drive_position]
    bufferOffset = _serializer.uint16(obj.drive_position, buffer, bufferOffset);
    // Serialize message field [steering_position]
    bufferOffset = _serializer.uint16(obj.steering_position, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MaestroIn
    let len;
    let data = new MaestroIn(null);
    // Deserialize message field [drive_position]
    data.drive_position = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [steering_position]
    data.steering_position = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'maestro/MaestroIn';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5ef4ccf9beba43d4d1391a882e59d0cf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16 drive_position
    uint16 steering_position
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MaestroIn(null);
    if (msg.drive_position !== undefined) {
      resolved.drive_position = msg.drive_position;
    }
    else {
      resolved.drive_position = 0
    }

    if (msg.steering_position !== undefined) {
      resolved.steering_position = msg.steering_position;
    }
    else {
      resolved.steering_position = 0
    }

    return resolved;
    }
};

module.exports = MaestroIn;
