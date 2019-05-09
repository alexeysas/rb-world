#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <math.h> 
#include "pick_objects/RobotAction.h"

#define PI 3.14159265

// Define a client for to send goal requests to the move_base server through a SimpleActionClient
typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;

move_base_msgs::MoveBaseGoal GetGoalMessage(float x, float y, float yaw)
{
  
  move_base_msgs::MoveBaseGoal goal;
    // set up the frame parameters
  goal.target_pose.header.frame_id = "map";
  goal.target_pose.header.stamp = ros::Time::now();

  // Define a position and orientation for the robot to reach
  goal.target_pose.pose.position.x = x;
  goal.target_pose.pose.position.y = y;
  
  goal.target_pose.pose.orientation.z = sin(yaw / 2.0);
  goal.target_pose.pose.orientation.w = cos(yaw / 2.0);

  return goal;
}

bool SendAndWait(move_base_msgs::MoveBaseGoal goal, MoveBaseClient &ac)
{
  // Send the goal position and orientation for the robot to reach
  ROS_INFO("Sending goal");
  ac.sendGoal(goal);

  // Wait an infinite time for the results
  ac.waitForResult();

  // Check if the robot reached its goal
  return ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED;
}

int main(int argc, char** argv){
  // Initialize the simple_navigation_goals node
  ros::init(argc, argv, "pick_objects");

  ros::NodeHandle nh;
  double start_x, start_y;
  double end_x, end_y;
  double start_yaw, end_yaw;
  
  pick_objects::RobotAction pick_action;

  nh.getParam("/pick_objects/start_x", start_x);
  nh.getParam("/pick_objects/start_y", start_y);
  nh.getParam("/pick_objects/end_x", end_x);
  nh.getParam("/pick_objects/end_y", end_y);
  nh.getParam("/pick_objects/start_yaw", start_yaw);
  nh.getParam("/pick_objects/end_yaw", end_yaw);


  // create publisher which notify when object is picked or dropped off.
  ros::Publisher pickerPublisher = nh.advertise<pick_objects::RobotAction>("/home/object_action", 1);

  //tell the action client that we want to spin a thread by default
  MoveBaseClient ac("move_base", true);

  // Wait 5 sec for move_base action server to come up
  while(!ac.waitForServer(ros::Duration(5.0))){
    ROS_INFO("Waiting for the move_base action server to come up");
  }

 
  // place object to the world - so add_markers node knows that object is placed
  pick_action.action = false;
  pick_action.x = start_x;
  pick_action.y = start_y;

  pickerPublisher.publish(pick_action);


  move_base_msgs::MoveBaseGoal goal = GetGoalMessage((float)start_x, (float)start_y, (float)start_yaw);
  bool goalReached = SendAndWait(goal, ac);

  // Check if the robot reached its goal
  if(!goalReached)
  {
      ROS_INFO("Robot failed to reach pickup zone.");
      return 0;
  }
  
  ROS_INFO("Robot reached pickup zone.");
  ROS_INFO("Picking up object...");
  
  ros::Duration(5).sleep();

  ROS_INFO("Object picked.");

  pick_action.action = true;
  pick_action.x = start_x;
  pick_action.y = start_y;

  pickerPublisher.publish(pick_action);

  ROS_INFO("Moving to dropoff zone...");
  
  goal = GetGoalMessage((float)end_x, (float)end_y, (float)end_yaw);
  goalReached = SendAndWait(goal, ac);

  // Check if the robot reached its goal
  if(!goalReached)
  {
      ROS_INFO("Robot failed to reach dropoff zone.");
      return 0;
  }

  pick_action.action = false;
  pick_action.x = end_x;
  pick_action.y = end_y;

  pickerPublisher.publish(pick_action);
  ROS_INFO("Robot reached dropoff zone.");
  
  ros::spin();
  return 0;
}