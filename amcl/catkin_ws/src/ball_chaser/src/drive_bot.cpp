#include "ros/ros.h"
#include "geometry_msgs/Twist.h"

//TODO: Include the ball_chaser "DriveToTarget" header file
#include "ball_chaser/DriveToTarget.h"
#include <std_msgs/Float64.h>

// ROS::Publisher motor commands;
ros::Publisher motor_command_publisher;

// TODO: Create a handle_drive_request callback function that executes whenever a drive_bot service is requested
// This function should publish the requested linear x and angular velocities to the robot wheel joints
// After publishing the requested velocities, a message feedback should be returned with the requested wheel velocities


bool handle_request(ball_chaser::DriveToTarget::Request& req,
    ball_chaser::DriveToTarget::Response& res)
{

    ROS_INFO("DriveToTarget request received - j1:%1.2f, j2:%1.2f", (float)req.linear_x, (float)req.angular_z);
   
    geometry_msgs::Twist msg;
    msg.linear.x = req.linear_x;     
    msg.angular.z = req.angular_z;

    motor_command_publisher.publish(msg);
   
    // Return a response message
    res.msg_feedback = "LinearX set to " + std::to_string(msg.linear.x) + " and angularZ set to " + std::to_string(msg.angular.z);
    ROS_INFO_STREAM(res.msg_feedback);

    return true;
}


int main(int argc, char** argv)
{
    // Initialize a ROS node
    ros::init(argc, argv, "drive_bot");

    // Create a ROS NodeHandle object
    ros::NodeHandle n;

    // Inform ROS master that we will be publishing a message of type geometry_msgs::Twist on the robot actuation topic with a publishing queue size of 10
    motor_command_publisher = n.advertise<geometry_msgs::Twist>("/cmd_vel", 10);

    // TODO: Define a drive /ball_chaser/command_robot service with a handle_drive_request callback function
    ros::ServiceServer service = n.advertiseService("/ball_chaser/command_robot", handle_request);
  
    // TODO: Delete the loop, move the code to the inside of the callback function and make the necessary changes to publish the requested velocities instead of constant values
    ROS_INFO("/ball_chaser/command_robot service is ready to process move commands");

    // TODO: Handle ROS communication events
    ros::spin();

    return 0;
}