; Auto-generated. Do not edit!


(cl:in-package maestro-msg)


;//! \htmlinclude VelAndAngle.msg.html

(cl:defclass <VelAndAngle> (roslisp-msg-protocol:ros-message)
  ((velocity
    :reader velocity
    :initarg :velocity
    :type cl:float
    :initform 0.0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0)
   (currTime
    :reader currTime
    :initarg :currTime
    :type cl:float
    :initform 0.0))
)

(cl:defclass VelAndAngle (<VelAndAngle>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VelAndAngle>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VelAndAngle)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name maestro-msg:<VelAndAngle> is deprecated: use maestro-msg:VelAndAngle instead.")))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <VelAndAngle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader maestro-msg:velocity-val is deprecated.  Use maestro-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <VelAndAngle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader maestro-msg:angle-val is deprecated.  Use maestro-msg:angle instead.")
  (angle m))

(cl:ensure-generic-function 'currTime-val :lambda-list '(m))
(cl:defmethod currTime-val ((m <VelAndAngle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader maestro-msg:currTime-val is deprecated.  Use maestro-msg:currTime instead.")
  (currTime m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VelAndAngle>) ostream)
  "Serializes a message object of type '<VelAndAngle>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'velocity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'currTime))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VelAndAngle>) istream)
  "Deserializes a message object of type '<VelAndAngle>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'velocity) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'currTime) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VelAndAngle>)))
  "Returns string type for a message object of type '<VelAndAngle>"
  "maestro/VelAndAngle")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VelAndAngle)))
  "Returns string type for a message object of type 'VelAndAngle"
  "maestro/VelAndAngle")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VelAndAngle>)))
  "Returns md5sum for a message object of type '<VelAndAngle>"
  "69a8927aa7214d20fb684df692e4d5c4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VelAndAngle)))
  "Returns md5sum for a message object of type 'VelAndAngle"
  "69a8927aa7214d20fb684df692e4d5c4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VelAndAngle>)))
  "Returns full string definition for message of type '<VelAndAngle>"
  (cl:format cl:nil "float64 velocity~%float64 angle~%float64 currTime~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VelAndAngle)))
  "Returns full string definition for message of type 'VelAndAngle"
  (cl:format cl:nil "float64 velocity~%float64 angle~%float64 currTime~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VelAndAngle>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VelAndAngle>))
  "Converts a ROS message object to a list"
  (cl:list 'VelAndAngle
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':angle (angle msg))
    (cl:cons ':currTime (currTime msg))
))
