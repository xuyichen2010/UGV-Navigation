
(cl:in-package :asdf)

(defsystem "phidget_spatial-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Inertia" :depends-on ("_package_Inertia"))
    (:file "_package_Inertia" :depends-on ("_package"))
  ))