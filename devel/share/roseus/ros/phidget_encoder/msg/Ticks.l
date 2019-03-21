;; Auto-generated. Do not edit!


(when (boundp 'phidget_encoder::Ticks)
  (if (not (find-package "PHIDGET_ENCODER"))
    (make-package "PHIDGET_ENCODER"))
  (shadow 'Ticks (find-package "PHIDGET_ENCODER")))
(unless (find-package "PHIDGET_ENCODER::TICKS")
  (make-package "PHIDGET_ENCODER::TICKS"))

(in-package "ROS")
;;//! \htmlinclude Ticks.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass phidget_encoder::Ticks
  :super ros::object
  :slots (_header _position _relative_change _elapsed_time ))

(defmethod phidget_encoder::Ticks
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:position __position) 0)
    ((:relative_change __relative_change) 0)
    ((:elapsed_time __elapsed_time) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _position (round __position))
   (setq _relative_change (round __relative_change))
   (setq _elapsed_time (round __elapsed_time))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:relative_change
   (&optional __relative_change)
   (if __relative_change (setq _relative_change __relative_change)) _relative_change)
  (:elapsed_time
   (&optional __elapsed_time)
   (if __elapsed_time (setq _elapsed_time __elapsed_time)) _elapsed_time)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int64 _position
    8
    ;; int64 _relative_change
    8
    ;; int64 _elapsed_time
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int64 _position
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _position (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _position) (= (length (_position . bv)) 2)) ;; bignum
              (write-long (ash (elt (_position . bv) 0) 0) s)
              (write-long (ash (elt (_position . bv) 1) -1) s))
             ((and (class _position) (= (length (_position . bv)) 1)) ;; big1
              (write-long (elt (_position . bv) 0) s)
              (write-long (if (>= _position 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _position s)(write-long (if (>= _position 0) 0 #xffffffff) s)))
     ;; int64 _relative_change
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _relative_change (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _relative_change) (= (length (_relative_change . bv)) 2)) ;; bignum
              (write-long (ash (elt (_relative_change . bv) 0) 0) s)
              (write-long (ash (elt (_relative_change . bv) 1) -1) s))
             ((and (class _relative_change) (= (length (_relative_change . bv)) 1)) ;; big1
              (write-long (elt (_relative_change . bv) 0) s)
              (write-long (if (>= _relative_change 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _relative_change s)(write-long (if (>= _relative_change 0) 0 #xffffffff) s)))
     ;; int64 _elapsed_time
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _elapsed_time (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _elapsed_time) (= (length (_elapsed_time . bv)) 2)) ;; bignum
              (write-long (ash (elt (_elapsed_time . bv) 0) 0) s)
              (write-long (ash (elt (_elapsed_time . bv) 1) -1) s))
             ((and (class _elapsed_time) (= (length (_elapsed_time . bv)) 1)) ;; big1
              (write-long (elt (_elapsed_time . bv) 0) s)
              (write-long (if (>= _elapsed_time 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _elapsed_time s)(write-long (if (>= _elapsed_time 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int64 _position
#+(or :alpha :irix6 :x86_64)
      (setf _position (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _position (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _relative_change
#+(or :alpha :irix6 :x86_64)
      (setf _relative_change (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _relative_change (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _elapsed_time
#+(or :alpha :irix6 :x86_64)
      (setf _elapsed_time (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _elapsed_time (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
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

(setf (get phidget_encoder::Ticks :md5sum-) "77d9a9cff4b2322ae71df049c436273f")
(setf (get phidget_encoder::Ticks :datatype-) "phidget_encoder/Ticks")
(setf (get phidget_encoder::Ticks :definition-)
      "Header header
int64 position
int64 relative_change
int64 elapsed_time

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



(provide :phidget_encoder/Ticks "77d9a9cff4b2322ae71df049c436273f")


