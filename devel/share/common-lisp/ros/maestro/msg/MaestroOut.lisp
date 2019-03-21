; Auto-generated. Do not edit!


(cl:in-package maestro-msg)


;//! \htmlinclude MaestroOut.msg.html

(cl:defclass <MaestroOut> (roslisp-msg-protocol:ros-message)
  ((error
    :reader error
    :initarg :error
    :type cl:integer
    :initform 0)
   (drive_position
    :reader drive_position
    :initarg :drive_position
    :type cl:fixnum
    :initform 0)
   (steering_position
    :reader steering_position
    :initarg :steering_position
    :type cl:fixnum
    :initform 0)
   (currTime
    :reader currTime
    :initarg :currTime
    :type cl:float
    :initform 0.0))
)

(cl:defclass MaestroOut (<MaestroOut>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MaestroOut>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MaestroOut)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name maestro-msg:<MaestroOut> is deprecated: use maestro-msg:MaestroOut instead.")))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <MaestroOut>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader maestro-msg:error-val is deprecated.  Use maestro-msg:error instead.")
  (error m))

(cl:ensure-generic-function 'drive_position-val :lambda-list '(m))
(cl:defmethod drive_position-val ((m <MaestroOut>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader maestro-msg:drive_position-val is deprecated.  Use maestro-msg:drive_position instead.")
  (drive_position m))

(cl:ensure-generic-function 'steering_position-val :lambda-list '(m))
(cl:defmethod steering_position-val ((m <MaestroOut>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader maestro-msg:steering_position-val is deprecated.  Use maestro-msg:steering_position instead.")
  (steering_position m))

(cl:ensure-generic-function 'currTime-val :lambda-list '(m))
(cl:defmethod currTime-val ((m <MaestroOut>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader maestro-msg:currTime-val is deprecated.  Use maestro-msg:currTime instead.")
  (currTime m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MaestroOut>) ostream)
  "Serializes a message object of type '<MaestroOut>"
  (cl:let* ((signed (cl:slot-value msg 'error)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'drive_position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'drive_position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steering_position)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'steering_position)) ostream)
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MaestroOut>) istream)
  "Deserializes a message object of type '<MaestroOut>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'error) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'drive_position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'drive_position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'steering_position)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'steering_position)) (cl:read-byte istream))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MaestroOut>)))
  "Returns string type for a message object of type '<MaestroOut>"
  "maestro/MaestroOut")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MaestroOut)))
  "Returns string type for a message object of type 'MaestroOut"
  "maestro/MaestroOut")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MaestroOut>)))
  "Returns md5sum for a message object of type '<MaestroOut>"
  "bb3af52bc1b2d97529b338a827a298a4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MaestroOut)))
  "Returns md5sum for a message object of type 'MaestroOut"
  "bb3af52bc1b2d97529b338a827a298a4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MaestroOut>)))
  "Returns full string definition for message of type '<MaestroOut>"
  (cl:format cl:nil "int32 error~%uint16 drive_position~%uint16 steering_position~%float64 currTime~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MaestroOut)))
  "Returns full string definition for message of type 'MaestroOut"
  (cl:format cl:nil "int32 error~%uint16 drive_position~%uint16 steering_position~%float64 currTime~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MaestroOut>))
  (cl:+ 0
     4
     2
     2
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MaestroOut>))
  "Converts a ROS message object to a list"
  (cl:list 'MaestroOut
    (cl:cons ':error (error msg))
    (cl:cons ':drive_position (drive_position msg))
    (cl:cons ':steering_position (steering_position msg))
    (cl:cons ':currTime (currTime msg))
))
