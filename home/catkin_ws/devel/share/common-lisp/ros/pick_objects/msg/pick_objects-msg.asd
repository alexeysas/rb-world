
(cl:in-package :asdf)

(defsystem "pick_objects-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "RobotAction" :depends-on ("_package_RobotAction"))
    (:file "_package_RobotAction" :depends-on ("_package"))
  ))