;; Auto-generated. Do not edit!


(when (boundp 'utm_laser::Calibration)
  (if (not (find-package "UTM_LASER"))
    (make-package "UTM_LASER"))
  (shadow 'Calibration (find-package "UTM_LASER")))
(unless (find-package "UTM_LASER::CALIBRATION")
  (make-package "UTM_LASER::CALIBRATION"))

(in-package "ROS")
;;//! \htmlinclude Calibration.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass utm_laser::Calibration
  :super ros::object
  :slots (_header _range _intensity ))

(defmethod utm_laser::Calibration
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:range __range) 0.0)
    ((:intensity __intensity) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _range (float __range))
   (setq _intensity (float __intensity))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:range
   (&optional __range)
   (if __range (setq _range __range)) _range)
  (:intensity
   (&optional __intensity)
   (if __intensity (setq _intensity __intensity)) _intensity)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _range
    8
    ;; float64 _intensity
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _range
       (sys::poke _range (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _intensity
       (sys::poke _intensity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _range
     (setq _range (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _intensity
     (setq _intensity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get utm_laser::Calibration :md5sum-) "3bca64b68468880c25caa947a0502da5")
(setf (get utm_laser::Calibration :datatype-) "utm_laser/Calibration")
(setf (get utm_laser::Calibration :definition-)
      "Header header
float64 range
float64 intensity

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



(provide :utm_laser/Calibration "3bca64b68468880c25caa947a0502da5")


