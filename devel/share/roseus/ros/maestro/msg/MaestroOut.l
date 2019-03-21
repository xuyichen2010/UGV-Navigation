;; Auto-generated. Do not edit!


(when (boundp 'maestro::MaestroOut)
  (if (not (find-package "MAESTRO"))
    (make-package "MAESTRO"))
  (shadow 'MaestroOut (find-package "MAESTRO")))
(unless (find-package "MAESTRO::MAESTROOUT")
  (make-package "MAESTRO::MAESTROOUT"))

(in-package "ROS")
;;//! \htmlinclude MaestroOut.msg.html


(defclass maestro::MaestroOut
  :super ros::object
  :slots (_error _drive_position _steering_position _currTime ))

(defmethod maestro::MaestroOut
  (:init
   (&key
    ((:error __error) 0)
    ((:drive_position __drive_position) 0)
    ((:steering_position __steering_position) 0)
    ((:currTime __currTime) 0.0)
    )
   (send-super :init)
   (setq _error (round __error))
   (setq _drive_position (round __drive_position))
   (setq _steering_position (round __steering_position))
   (setq _currTime (float __currTime))
   self)
  (:error
   (&optional __error)
   (if __error (setq _error __error)) _error)
  (:drive_position
   (&optional __drive_position)
   (if __drive_position (setq _drive_position __drive_position)) _drive_position)
  (:steering_position
   (&optional __steering_position)
   (if __steering_position (setq _steering_position __steering_position)) _steering_position)
  (:currTime
   (&optional __currTime)
   (if __currTime (setq _currTime __currTime)) _currTime)
  (:serialization-length
   ()
   (+
    ;; int32 _error
    4
    ;; uint16 _drive_position
    2
    ;; uint16 _steering_position
    2
    ;; float64 _currTime
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _error
       (write-long _error s)
     ;; uint16 _drive_position
       (write-word _drive_position s)
     ;; uint16 _steering_position
       (write-word _steering_position s)
     ;; float64 _currTime
       (sys::poke _currTime (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _error
     (setq _error (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint16 _drive_position
     (setq _drive_position (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _steering_position
     (setq _steering_position (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float64 _currTime
     (setq _currTime (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get maestro::MaestroOut :md5sum-) "bb3af52bc1b2d97529b338a827a298a4")
(setf (get maestro::MaestroOut :datatype-) "maestro/MaestroOut")
(setf (get maestro::MaestroOut :definition-)
      "int32 error
uint16 drive_position
uint16 steering_position
float64 currTime

")



(provide :maestro/MaestroOut "bb3af52bc1b2d97529b338a827a298a4")


