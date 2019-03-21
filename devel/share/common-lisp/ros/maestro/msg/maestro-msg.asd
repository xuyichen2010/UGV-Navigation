
(cl:in-package :asdf)

(defsystem "maestro-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "MaestroIn" :depends-on ("_package_MaestroIn"))
    (:file "_package_MaestroIn" :depends-on ("_package"))
    (:file "MaestroOut" :depends-on ("_package_MaestroOut"))
    (:file "_package_MaestroOut" :depends-on ("_package"))
    (:file "VelAndAngle" :depends-on ("_package_VelAndAngle"))
    (:file "_package_VelAndAngle" :depends-on ("_package"))
  ))