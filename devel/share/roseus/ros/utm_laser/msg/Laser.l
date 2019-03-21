;; Auto-generated. Do not edit!


(when (boundp 'utm_laser::Laser)
  (if (not (find-package "UTM_LASER"))
    (make-package "UTM_LASER"))
  (shadow 'Laser (find-package "UTM_LASER")))
(unless (find-package "UTM_LASER::LASER")
  (make-package "UTM_LASER::LASER"))

(in-package "ROS")
;;//! \htmlinclude Laser.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass utm_laser::Laser
  :super ros::object
  :slots (_header _Target_Easting _Target_Northing ))

(defmethod utm_laser::Laser
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:Target_Easting __Target_Easting) 0.0)
    ((:Target_Northing __Target_Northing) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _Target_Easting (float __Target_Easting))
   (setq _Target_Northing (float __Target_Northing))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:Target_Easting
   (&optional __Target_Easting)
   (if __Target_Easting (setq _Target_Easting __Target_Easting)) _Target_Easting)
  (:Target_Northing
   (&optional __Target_Northing)
   (if __Target_Northing (setq _Target_Northing __Target_Northing)) _Target_Northing)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _Target_Easting
    8
    ;; float64 _Target_Northing
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _Target_Easting
       (sys::poke _Target_Easting (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Target_Northing
       (sys::poke _Target_Northing (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _Target_Easting
     (setq _Target_Easting (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Target_Northing
     (setq _Target_Northing (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get utm_laser::Laser :md5sum-) "d3ef403ce43b03eb3ad99eeb89714ea8")
(setf (get utm_laser::Laser :datatype-) "utm_laser/Laser")
(setf (get utm_laser::Laser :definition-)
      "Header header
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

")



(provide :utm_laser/Laser "d3ef403ce43b03eb3ad99eeb89714ea8")


