;; Auto-generated. Do not edit!


(when (boundp 'phidget_encoder::Speed)
  (if (not (find-package "PHIDGET_ENCODER"))
    (make-package "PHIDGET_ENCODER"))
  (shadow 'Speed (find-package "PHIDGET_ENCODER")))
(unless (find-package "PHIDGET_ENCODER::SPEED")
  (make-package "PHIDGET_ENCODER::SPEED"))

(in-package "ROS")
;;//! \htmlinclude Speed.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass phidget_encoder::Speed
  :super ros::object
  :slots (_header _velocity ))

(defmethod phidget_encoder::Speed
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:velocity __velocity) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _velocity (round __velocity))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int64 _velocity
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int64 _velocity
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _velocity (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _velocity) (= (length (_velocity . bv)) 2)) ;; bignum
              (write-long (ash (elt (_velocity . bv) 0) 0) s)
              (write-long (ash (elt (_velocity . bv) 1) -1) s))
             ((and (class _velocity) (= (length (_velocity . bv)) 1)) ;; big1
              (write-long (elt (_velocity . bv) 0) s)
              (write-long (if (>= _velocity 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _velocity s)(write-long (if (>= _velocity 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int64 _velocity
#+(or :alpha :irix6 :x86_64)
      (setf _velocity (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _velocity (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get phidget_encoder::Speed :md5sum-) "dc4f1ff0648492c35aad7a050899d653")
(setf (get phidget_encoder::Speed :datatype-) "phidget_encoder/Speed")
(setf (get phidget_encoder::Speed :definition-)
      "Header header
int64 velocity

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

")



(provide :phidget_encoder/Speed "dc4f1ff0648492c35aad7a050899d653")


