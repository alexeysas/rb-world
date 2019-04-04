#include "ros/ros.h"
#include "ball_chaser/DriveToTarget.h"
#include <sensor_msgs/Image.h>

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

    uint pixelSize = img.step / img.width;

    //ROS_INFO_STREAM("" + std::to_string(pixelSize));

    //ROS_INFO_STREAM("" + std::to_string(img.data[0]));
    int white_pixel = 255;

    bool whiteFound = false;
    uint whiteX = 0;
    uint whiteY = 0;

    for (int x = 0; x < img.width; x++)
    {
         for (int y = 0; y < img.height; y++)
         {
             uint index = (img.width * pixelSize) * y + x * pixelSize;
             if (img.data[index] == 255 && img.data[index + 1] == 255 && img.data[index + 2] == 255)
             {
                 whiteFound = true;
                 whiteX = x;
                 whiteY = y;
                 break;
             }
         }
         if (whiteFound) 
         {
             break;
         }
    }

    ROS_INFO_STREAM("White pixel present" + std::to_string(whiteFound));
   
    uint oneThird = img.width / 3;
    if (whiteFound) 
    {
        if (whiteX < oneThird)
        {
            drive_robot(0.0, 0.5);
        }
        else if (whiteX < 2 * oneThird)
        {
            drive_robot(0.5, 0.0);
        }
        else 
        {
            drive_robot(0.0, -0.5);
        }
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