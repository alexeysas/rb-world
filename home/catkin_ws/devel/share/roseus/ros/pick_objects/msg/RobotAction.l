;; Auto-generated. Do not edit!


(when (boundp 'pick_objects::RobotAction)
  (if (not (find-package "PICK_OBJECTS"))
    (make-package "PICK_OBJECTS"))
  (shadow 'RobotAction (find-package "PICK_OBJECTS")))
(unless (find-package "PICK_OBJECTS::ROBOTACTION")
  (make-package "PICK_OBJECTS::ROBOTACTION"))

(in-package "ROS")
;;//! \htmlinclude RobotAction.msg.html


(defclass pick_objects::RobotAction
  :super ros::object
  :slots (_action _x _y ))

(defmethod pick_objects::RobotAction
  (:init
   (&key
    ((:action __action) nil)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    )
   (send-super :init)
   (setq _action __action)
   (setq _x (float __x))
   (setq _y (float __y))
   self)
  (:action
   (&optional __action)
   (if __action (setq _action __action)) _action)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:serialization-length
   ()
   (+
    ;; bool _action
    1
    ;; float32 _x
    4
    ;; float32 _y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _action
       (if _action (write-byte -1 s) (write-byte 0 s))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _action
     (setq _action (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get pick_objects::RobotAction :md5sum-) "982dc1c368a80250eddaf33c1acb1d3d")
(setf (get pick_objects::RobotAction :datatype-) "pick_objects/RobotAction")
(setf (get pick_objects::RobotAction :definition-)
      "bool action
float32 x
float32 y
")



(provide :pick_objects/RobotAction "982dc1c368a80250eddaf33c1acb1d3d")


