
(cl:in-package :asdf)

(defsystem "phidget_encoder-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Speed" :depends-on ("_package_Speed"))
    (:file "_package_Speed" :depends-on ("_package"))
    (:file "Ticks" :depends-on ("_package_Ticks"))
    (:file "_package_Ticks" :depends-on ("_package"))
  ))