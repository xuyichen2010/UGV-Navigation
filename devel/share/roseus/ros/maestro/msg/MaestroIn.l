;; Auto-generated. Do not edit!


(when (boundp 'maestro::MaestroIn)
  (if (not (find-package "MAESTRO"))
    (make-package "MAESTRO"))
  (shadow 'MaestroIn (find-package "MAESTRO")))
(unless (find-package "MAESTRO::MAESTROIN")
  (make-package "MAESTRO::MAESTROIN"))

(in-package "ROS")
;;//! \htmlinclude MaestroIn.msg.html


(defclass maestro::MaestroIn
  :super ros::object
  :slots (_drive_position _steering_position ))

(defmethod maestro::MaestroIn
  (:init
   (&key
    ((:drive_position __drive_position) 0)
    ((:steering_position __steering_position) 0)
    )
   (send-super :init)
   (setq _drive_position (round __drive_position))
   (setq _steering_position (round __steering_position))
   self)
  (:drive_position
   (&optional __drive_position)
   (if __drive_position (setq _drive_position __drive_position)) _drive_position)
  (:steering_position
   (&optional __steering_position)
   (if __steering_position (setq _steering_position __steering_position)) _steering_position)
  (:serialization-length
   ()
   (+
    ;; uint16 _drive_position
    2
    ;; uint16 _steering_position
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _drive_position
       (write-word _drive_position s)
     ;; uint16 _steering_position
       (write-word _steering_position s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _drive_position
     (setq _drive_position (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _steering_position
     (setq _steering_position (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get maestro::MaestroIn :md5sum-) "5ef4ccf9beba43d4d1391a882e59d0cf")
(setf (get maestro::MaestroIn :datatype-) "maestro/MaestroIn")
(setf (get maestro::MaestroIn :definition-)
      "uint16 drive_position
uint16 steering_position

")



(provide :maestro/MaestroIn "5ef4ccf9beba43d4d1391a882e59d0cf")


