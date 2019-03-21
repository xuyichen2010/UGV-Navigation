;; Auto-generated. Do not edit!


(when (boundp 'phidget_spatial::Inertia)
  (if (not (find-package "PHIDGET_SPATIAL"))
    (make-package "PHIDGET_SPATIAL"))
  (shadow 'Inertia (find-package "PHIDGET_SPATIAL")))
(unless (find-package "PHIDGET_SPATIAL::INERTIA")
  (make-package "PHIDGET_SPATIAL::INERTIA"))

(in-package "ROS")
;;//! \htmlinclude Inertia.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass phidget_spatial::Inertia
  :super ros::object
  :slots (_header _timeSecs _timeMicroSecs _xAccel _yAccel _zAccel _xAngular _yAngular _zAngular _xMagField _yMagField _zMagField ))

(defmethod phidget_spatial::Inertia
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:timeSecs __timeSecs) 0.0)
    ((:timeMicroSecs __timeMicroSecs) 0.0)
    ((:xAccel __xAccel) 0.0)
    ((:yAccel __yAccel) 0.0)
    ((:zAccel __zAccel) 0.0)
    ((:xAngular __xAngular) 0.0)
    ((:yAngular __yAngular) 0.0)
    ((:zAngular __zAngular) 0.0)
    ((:xMagField __xMagField) 0.0)
    ((:yMagField __yMagField) 0.0)
    ((:zMagField __zMagField) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _timeSecs (float __timeSecs))
   (setq _timeMicroSecs (float __timeMicroSecs))
   (setq _xAccel (float __xAccel))
   (setq _yAccel (float __yAccel))
   (setq _zAccel (float __zAccel))
   (setq _xAngular (float __xAngular))
   (setq _yAngular (float __yAngular))
   (setq _zAngular (float __zAngular))
   (setq _xMagField (float __xMagField))
   (setq _yMagField (float __yMagField))
   (setq _zMagField (float __zMagField))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:timeSecs
   (&optional __timeSecs)
   (if __timeSecs (setq _timeSecs __timeSecs)) _timeSecs)
  (:timeMicroSecs
   (&optional __timeMicroSecs)
   (if __timeMicroSecs (setq _timeMicroSecs __timeMicroSecs)) _timeMicroSecs)
  (:xAccel
   (&optional __xAccel)
   (if __xAccel (setq _xAccel __xAccel)) _xAccel)
  (:yAccel
   (&optional __yAccel)
   (if __yAccel (setq _yAccel __yAccel)) _yAccel)
  (:zAccel
   (&optional __zAccel)
   (if __zAccel (setq _zAccel __zAccel)) _zAccel)
  (:xAngular
   (&optional __xAngular)
   (if __xAngular (setq _xAngular __xAngular)) _xAngular)
  (:yAngular
   (&optional __yAngular)
   (if __yAngular (setq _yAngular __yAngular)) _yAngular)
  (:zAngular
   (&optional __zAngular)
   (if __zAngular (setq _zAngular __zAngular)) _zAngular)
  (:xMagField
   (&optional __xMagField)
   (if __xMagField (setq _xMagField __xMagField)) _xMagField)
  (:yMagField
   (&optional __yMagField)
   (if __yMagField (setq _yMagField __yMagField)) _yMagField)
  (:zMagField
   (&optional __zMagField)
   (if __zMagField (setq _zMagField __zMagField)) _zMagField)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _timeSecs
    8
    ;; float64 _timeMicroSecs
    8
    ;; float64 _xAccel
    8
    ;; float64 _yAccel
    8
    ;; float64 _zAccel
    8
    ;; float64 _xAngular
    8
    ;; float64 _yAngular
    8
    ;; float64 _zAngular
    8
    ;; float64 _xMagField
    8
    ;; float64 _yMagField
    8
    ;; float64 _zMagField
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _timeSecs
       (sys::poke _timeSecs (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _timeMicroSecs
       (sys::poke _timeMicroSecs (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _xAccel
       (sys::poke _xAccel (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yAccel
       (sys::poke _yAccel (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _zAccel
       (sys::poke _zAccel (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _xAngular
       (sys::poke _xAngular (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yAngular
       (sys::poke _yAngular (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _zAngular
       (sys::poke _zAngular (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _xMagField
       (sys::poke _xMagField (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yMagField
       (sys::poke _yMagField (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _zMagField
       (sys::poke _zMagField (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _timeSecs
     (setq _timeSecs (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _timeMicroSecs
     (setq _timeMicroSecs (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _xAccel
     (setq _xAccel (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yAccel
     (setq _yAccel (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _zAccel
     (setq _zAccel (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _xAngular
     (setq _xAngular (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yAngular
     (setq _yAngular (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _zAngular
     (setq _zAngular (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _xMagField
     (setq _xMagField (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yMagField
     (setq _yMagField (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _zMagField
     (setq _zMagField (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get phidget_spatial::Inertia :md5sum-) "25b07e6d95874255a426afc6f666ece0")
(setf (get phidget_spatial::Inertia :datatype-) "phidget_spatial/Inertia")
(setf (get phidget_spatial::Inertia :definition-)
      "Header header
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

")



(provide :phidget_spatial/Inertia "25b07e6d95874255a426afc6f666ece0")


