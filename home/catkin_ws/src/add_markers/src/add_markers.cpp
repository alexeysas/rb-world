#include <ros/ros.h>
#include <visualization_msgs/Marker.h>
#include <math.h>
#include "pick_objects/RobotAction.h"

class MarkersManager
{
public:
    ros::Publisher marker_pub;
    visualization_msgs::Marker marker;
    void ProcessObjectAction(const pick_objects::RobotAction &msg);
    void MoveMarker(float x, float y);
    void CreateMarker(float x, float y);
};

void MarkersManager::CreateMarker(float x, float y)
{

    // Set our initial shape type to be a cube
    uint32_t shape = visualization_msgs::Marker::CUBE;

    // Set the frame ID and timestamp.  See the TF tutorials for information on these.
    marker.header.frame_id = "map";
    marker.header.stamp = ros::Time::now();

    // Set the namespace and id for this marker.  This serves to create a unique ID
    // Any marker sent with the same namespace and id will overwrite the old one
    marker.ns = "basic_shapes";
    marker.id = 0;

    // Set the marker type.  Initially this is CUBE, and cycles between that and SPHERE, ARROW, and CYLINDER
    marker.type = shape;

    // Set the pose of the marker.  This is a full 6DOF pose relative to the frame/time specified in the header
    marker.pose.position.x = x;
    marker.pose.position.y = y;
    marker.pose.position.z = 0;
    marker.pose.orientation.x = 0.0;
    marker.pose.orientation.y = 0.0;
    marker.pose.orientation.z = 0.0;
    marker.pose.orientation.w = 1.0;

    // Set the scale of the marker -- 1x1x1 here means 1m on a side
    marker.scale.x = 0.25;
    marker.scale.y = 0.25;
    marker.scale.z = 0.25;

    // Set the color -- be sure to set alpha to something non-zero!
    marker.color.r = 0.0f;
    marker.color.g = 1.0f;
    marker.color.b = 0.0f;
    marker.color.a = 1.0;

    marker.lifetime = ros::Duration();
}

void MarkersManager::MoveMarker(float x, float y)
{
    marker.pose.position.x = x;
    marker.pose.position.y = y;
    marker.pose.position.z = 0;
    marker.pose.orientation.x = 0.0;
    marker.pose.orientation.y = 0.0;
    marker.pose.orientation.z = 0.0;
    marker.pose.orientation.w = 0.0;
}

void MarkersManager::ProcessObjectAction(const pick_objects::RobotAction &msg)
{
    if (msg.action)
    {
        ROS_INFO("Removing marker...");
        MoveMarker(msg.x, msg.y);
        marker.action = visualization_msgs::Marker::DELETE;
        marker_pub.publish(marker);
    }
    else
    {
        ROS_INFO("Placing marker...");
        MoveMarker(msg.x, msg.y);
        marker.action = visualization_msgs::Marker::ADD;
        marker_pub.publish(marker);
    }
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "add_markers");

    MarkersManager manager;

    ros::NodeHandle n;
    ros::Rate r(1);
    manager.marker_pub = n.advertise<visualization_msgs::Marker>("visualization_marker", 1);
    ros::Subscriber sub = n.subscribe("/home/object_action", 1, &MarkersManager::ProcessObjectAction, &manager);

    double start_x, start_y;
    double end_x, end_y;

    std::string demo;

    while (manager.marker_pub.getNumSubscribers() < 1)
    {
        if (!ros::ok())
        {
            return 0;
        }
        ROS_WARN_ONCE("Please create a subscriber to the marker");
        sleep(1);
    }

    manager.CreateMarker((float)0, (float)0);

    // Check if demo mode and run in demo mode
    if (n.getParam("/add_markers/demo", demo))
    {
        n.getParam("/add_markers/start_x", start_x);
        n.getParam("/add_markers/start_y", start_y);
        n.getParam("/add_markers/end_x", end_x);
        n.getParam("/add_markers/end_y", end_y);

        ROS_INFO("Placing marker to the pickup zone");
        
        manager.MoveMarker((float)start_x, (float)start_y);
        manager.marker.action = visualization_msgs::Marker::ADD;
        manager.marker_pub.publish(manager.marker);

        ros::Duration(5).sleep();

        ROS_INFO("Removing marker from the pickup zone");
        manager.marker.action = visualization_msgs::Marker::DELETE;
        manager.marker_pub.publish(manager.marker);

        ros::Duration(5).sleep();

        ROS_INFO("Placing marker to the dropoff zone");

        manager.MoveMarker((float)end_x, (float)end_y);
        manager.marker.action = visualization_msgs::Marker::ADD;
        manager.marker_pub.publish(manager.marker);
    } 
   
    ros::spin();
}