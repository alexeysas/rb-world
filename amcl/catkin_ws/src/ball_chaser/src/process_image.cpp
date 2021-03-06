#include "ros/ros.h"
#include "ball_chaser/DriveToTarget.h"
#include <sensor_msgs/Image.h>
#include <vector>

// Define a global client that can request services
ros::ServiceClient client;

// This function calls the command_robot service to drive the robot in the specified direction
void drive_robot(float lin_x, float ang_z)
{
    ball_chaser::DriveToTarget srv;
    srv.request.linear_x = lin_x;
    srv.request.angular_z = ang_z;
   
    if (!client.call(srv))
        ROS_ERROR("Failed to call service command_robot");
}

// This callback function continuously executes and reads the image data
void process_image_callback(const sensor_msgs::Image img)
{

    float max_speed = 0.2;
    float max_angular_speed = 0.5;
    uint pixelSize = img.step / img.width;

    //ROS_INFO_STREAM("" + std::to_string(pixelSize));

    //ROS_INFO_STREAM("" + std::to_string(img.data[0]));
    int white_pixel = 255;

    bool whiteFound = false;
    uint oneThird = img.width / 3;
  
    std::vector<uint> counter(img.width);

    for (int x = 0; x < img.width; x++)
    {
         for (int y = 0; y < img.height; y++)
         {
             uint index = (img.width * pixelSize) * y + x * pixelSize;
             if (img.data[index] == 255 && img.data[index + 1] == 255 && img.data[index + 2] == 255)
             {
                whiteFound = true;
                counter[x] = counter[x] + 1;          
             }
         }       
    }

    ROS_INFO_STREAM("White pixel present: " + std::to_string(whiteFound));
   
    int argmax = std::distance(counter.begin(), std::max_element(counter.begin(), counter.end()));

    int diff = img.width / 2 - argmax;
    float x_speed = max_speed * (float)(img.width / 2 - abs(diff)) / (float)(img.width / 2);
    float angular_speed = max_angular_speed * (diff / (float)(img.width / 2));

    if (whiteFound) 
    {
        drive_robot(x_speed, angular_speed);
    }
    else 
    {
          drive_robot(0.0, 0.0);
    }

    // TODO: Loop through each pixel in the image and check if there's a bright white one
    // Then, identify if this pixel falls in the left, mid, or right side of the image
    // Depending on the white ball position, call the drive_bot function and pass velocities to it
    // Request a stop when there's no white ball seen by the camera
}

int main(int argc, char** argv)
{
    // Initialize the process_image node and create a handle to it
    ros::init(argc, argv, "process_image");
    ros::NodeHandle n;

    // Define a client service capable of requesting services from command_robot
    client = n.serviceClient<ball_chaser::DriveToTarget>("/ball_chaser/command_robot");

    // Subscribe to /camera/rgb/image_raw topic to read the image data inside the process_image_callback function
    ros::Subscriber sub1 = n.subscribe("/camera/rgb/image_raw", 10, process_image_callback);

    ROS_INFO("process_image node is ready");

    // Handle ROS communication events
    ros::spin();

    return 0;
}