;; Auto-generated. Do not edit!


(when (boundp 'maestro::VelAndAngle)
  (if (not (find-package "MAESTRO"))
    (make-package "MAESTRO"))
  (shadow 'VelAndAngle (find-package "MAESTRO")))
(unless (find-package "MAESTRO::VELANDANGLE")
  (make-package "MAESTRO::VELANDANGLE"))

(in-package "ROS")
;;//! \htmlinclude VelAndAngle.msg.html


(defclass maestro::VelAndAngle
  :super ros::object
  :slots (_velocity _angle _currTime ))

(defmethod maestro::VelAndAngle
  (:init
   (&key
    ((:velocity __velocity) 0.0)
    ((:angle __angle) 0.0)
    ((:currTime __currTime) 0.0)
    )
   (send-super :init)
   (setq _velocity (float __velocity))
   (setq _angle (float __angle))
   (setq _currTime (float __currTime))
   self)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:currTime
   (&optional __currTime)
   (if __currTime (setq _currTime __currTime)) _currTime)
  (:serialization-length
   ()
   (+
    ;; float64 _velocity
    8
    ;; float64 _angle
    8
    ;; float64 _currTime
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _currTime
       (sys::poke _currTime (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _velocity
     (setq _velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angle
     (setq _angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _currTime
     (setq _currTime (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get maestro::VelAndAngle :md5sum-) "69a8927aa7214d20fb684df692e4d5c4")
(setf (get maestro::VelAndAngle :datatype-) "maestro/VelAndAngle")
(setf (get maestro::VelAndAngle :definition-)
      "float64 velocity
float64 angle
float64 currTime

")



(provide :maestro/VelAndAngle "69a8927aa7214d20fb684df692e4d5c4")


