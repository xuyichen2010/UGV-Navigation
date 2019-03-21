;; Auto-generated. Do not edit!


(when (boundp 'phidget_gps::Data)
  (if (not (find-package "PHIDGET_GPS"))
    (make-package "PHIDGET_GPS"))
  (shadow 'Data (find-package "PHIDGET_GPS")))
(unless (find-package "PHIDGET_GPS::DATA")
  (make-package "PHIDGET_GPS::DATA"))

(in-package "ROS")
;;//! \htmlinclude Data.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass phidget_gps::Data
  :super ros::object
  :slots (_header _fix_status _latitude _longitude _altitude _is_velocity_valid _velocity _is_heading_valid _heading ))

(defmethod phidget_gps::Data
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:fix_status __fix_status) nil)
    ((:latitude __latitude) 0.0)
    ((:longitude __longitude) 0.0)
    ((:altitude __altitude) 0.0)
    ((:is_velocity_valid __is_velocity_valid) nil)
    ((:velocity __velocity) 0.0)
    ((:is_heading_valid __is_heading_valid) nil)
    ((:heading __heading) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _fix_status __fix_status)
   (setq _latitude (float __latitude))
   (setq _longitude (float __longitude))
   (setq _altitude (float __altitude))
   (setq _is_velocity_valid __is_velocity_valid)
   (setq _velocity (float __velocity))
   (setq _is_heading_valid __is_heading_valid)
   (setq _heading (float __heading))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:fix_status
   (&optional __fix_status)
   (if __fix_status (setq _fix_status __fix_status)) _fix_status)
  (:latitude
   (&optional __latitude)
   (if __latitude (setq _latitude __latitude)) _latitude)
  (:longitude
   (&optional __longitude)
   (if __longitude (setq _longitude __longitude)) _longitude)
  (:altitude
   (&optional __altitude)
   (if __altitude (setq _altitude __altitude)) _altitude)
  (:is_velocity_valid
   (&optional __is_velocity_valid)
   (if __is_velocity_valid (setq _is_velocity_valid __is_velocity_valid)) _is_velocity_valid)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:is_heading_valid
   (&optional __is_heading_valid)
   (if __is_heading_valid (setq _is_heading_valid __is_heading_valid)) _is_heading_valid)
  (:heading
   (&optional __heading)
   (if __heading (setq _heading __heading)) _heading)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _fix_status
    1
    ;; float64 _latitude
    8
    ;; float64 _longitude
    8
    ;; float64 _altitude
    8
    ;; bool _is_velocity_valid
    1
    ;; float64 _velocity
    8
    ;; bool _is_heading_valid
    1
    ;; float64 _heading
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _fix_status
       (if _fix_status (write-byte -1 s) (write-byte 0 s))
     ;; float64 _latitude
       (sys::poke _latitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _longitude
       (sys::poke _longitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _altitude
       (sys::poke _altitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _is_velocity_valid
       (if _is_velocity_valid (write-byte -1 s) (write-byte 0 s))
     ;; float64 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _is_heading_valid
       (if _is_heading_valid (write-byte -1 s) (write-byte 0 s))
     ;; float64 _heading
       (sys::poke _heading (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _fix_status
     (setq _fix_status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _latitude
     (setq _latitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _longitude
     (setq _longitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _altitude
     (setq _altitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _is_velocity_valid
     (setq _is_velocity_valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _velocity
     (setq _velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _is_heading_valid
     (setq _is_heading_valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _heading
     (setq _heading (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get phidget_gps::Data :md5sum-) "29c11ca0677b8b655fe476d7ca3ebb6b")
(setf (get phidget_gps::Data :datatype-) "phidget_gps/Data")
(setf (get phidget_gps::Data :definition-)
      "Header header
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

")



(provide :phidget_gps/Data "29c11ca0677b8b655fe476d7ca3ebb6b")


