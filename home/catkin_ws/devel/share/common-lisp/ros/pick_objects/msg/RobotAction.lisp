; Auto-generated. Do not edit!


(cl:in-package pick_objects-msg)


;//! \htmlinclude RobotAction.msg.html

(cl:defclass <RobotAction> (roslisp-msg-protocol:ros-message)
  ((action
    :reader action
    :initarg :action
    :type cl:boolean
    :initform cl:nil)
   (x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0))
)

(cl:defclass RobotAction (<RobotAction>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotAction>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotAction)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pick_objects-msg:<RobotAction> is deprecated: use pick_objects-msg:RobotAction instead.")))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <RobotAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_objects-msg:action-val is deprecated.  Use pick_objects-msg:action instead.")
  (action m))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <RobotAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_objects-msg:x-val is deprecated.  Use pick_objects-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <RobotAction>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pick_objects-msg:y-val is deprecated.  Use pick_objects-msg:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotAction>) ostream)
  "Serializes a message object of type '<RobotAction>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'action) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotAction>) istream)
  "Deserializes a message object of type '<RobotAction>"
    (cl:setf (cl:slot-value msg 'action) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotAction>)))
  "Returns string type for a message object of type '<RobotAction>"
  "pick_objects/RobotAction")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotAction)))
  "Returns string type for a message object of type 'RobotAction"
  "pick_objects/RobotAction")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotAction>)))
  "Returns md5sum for a message object of type '<RobotAction>"
  "982dc1c368a80250eddaf33c1acb1d3d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotAction)))
  "Returns md5sum for a message object of type 'RobotAction"
  "982dc1c368a80250eddaf33c1acb1d3d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotAction>)))
  "Returns full string definition for message of type '<RobotAction>"
  (cl:format cl:nil "bool action~%float32 x~%float32 y~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotAction)))
  "Returns full string definition for message of type 'RobotAction"
  (cl:format cl:nil "bool action~%float32 x~%float32 y~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotAction>))
  (cl:+ 0
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotAction>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotAction
    (cl:cons ':action (action msg))
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
