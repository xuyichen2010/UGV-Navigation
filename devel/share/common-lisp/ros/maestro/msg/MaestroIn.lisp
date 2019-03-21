; Auto-generated. Do not edit!


(cl:in-package maestro-msg)


;//! \htmlinclude MaestroIn.msg.html

(cl:defclass <MaestroIn> (roslisp-msg-protocol:ros-message)
  ((drive_position
    :reader drive_position
    :initarg :drive_position
    :type cl:fixnum
    :initform 0)
   (steering_position
    :reader steering_position
    :initarg :steering_position
    :type cl:fixnum
    :initform 0))
)

(cl:defclass MaestroIn (<MaestroIn>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MaestroIn>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MaestroIn)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name maestro-msg:<MaestroIn> is deprecated: use maestro-msg:MaestroIn instead.")))

(cl:ensure-generic-function 'drive_position-val :lambda-list '(m))
(cl:defmethod drive_position-val ((m <MaestroIn>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader maestro-msg:drive_position-val is deprecated.  Use maestro-msg:drive_position instead.")
  (drive_position m))

(cl:ensure-generic-function 'steering_position-val :lambda-list '(m))
(cl:defmethod steering_position-val ((m <MaestroIn>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader maestro-msg:steering_position-val is deprecated.  Use maestro-msg:steering_position instead.")
  (steering_position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MaestroIn>) ostream)
  "Serializes a message object of type '<MaestroIn>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'drive_position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'drive_position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steering_position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'steering_position)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MaestroIn>) istream)
  "Deserializes a message object of type '<MaestroIn>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'drive_position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'drive_position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steering_position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'steering_position)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MaestroIn>)))
  "Returns string type for a message object of type '<MaestroIn>"
  "maestro/MaestroIn")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MaestroIn)))
  "Returns string type for a message object of type 'MaestroIn"
  "maestro/MaestroIn")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MaestroIn>)))
  "Returns md5sum for a message object of type '<MaestroIn>"
  "5ef4ccf9beba43d4d1391a882e59d0cf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MaestroIn)))
  "Returns md5sum for a message object of type 'MaestroIn"
  "5ef4ccf9beba43d4d1391a882e59d0cf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MaestroIn>)))
  "Returns full string definition for message of type '<MaestroIn>"
  (cl:format cl:nil "uint16 drive_position~%uint16 steering_position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MaestroIn)))
  "Returns full string definition for message of type 'MaestroIn"
  (cl:format cl:nil "uint16 drive_position~%uint16 steering_position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MaestroIn>))
  (cl:+ 0
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MaestroIn>))
  "Converts a ROS message object to a list"
  (cl:list 'MaestroIn
    (cl:cons ':drive_position (drive_position msg))
    (cl:cons ':steering_position (steering_position msg))
))
