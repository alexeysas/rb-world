##  Goal
The goal of the project is to deploy robot to the the virtual home environment, autonomously map the environment using SLAM, provide robot with arbitrary navigation goals within the enviroment and test robot ability to reach goals using ROS Navigation stack. 


## Solution Summary

This project is implemented using  following ROS packages:

**[turtlebot_teleop](http://wiki.ros.org/turtlebot_teleop)**: The package provides turtlebot with ability for teleoperation with different input devices.

**[turtlebot_gazebo](http://wiki.ros.org/turtlebot_gazebo)**: Provides sample worlds and launch files which allows to deploy turtlebot to sample or custom gazebo worlds

**[turtlebot_rviz_launchers](http://wiki.ros.org/turtlebot_rviz_launchers)**: Provides predefined rviz configs for visualisation and interactions for the TurtleBot


**Mapping, Localization and Navigation is controlled by [Navigation stack:](http://wiki.ros.org/turtlebot_navigation/Tutorials/Setup%20the%20Navigation%20Stack%20for%20TurtleBot)**


**[gmapping](http://wiki.ros.org/gmapping)**: [Open SLAM](https://openslam-org.github.io/gmapping.html) based package to build grid maps from the laser range data.

Following [script](/catkin_ws/src/scripts/test_slam.sh) can be used to deploy a turtlebot inside the environment, interface it with a SLAM package, control it to build map and visualize the map in rviz.

**[amcl](http://wiki.ros.org/amcl)**: amcl is a probabilistic localization system for a robot moving in 2D. It implements the adaptive  Monte Carlo localization approach which uses a particle filter to track the pose of a robot against a known map. 

We provided this package with [map](/catkin_ws/src/map/my_map.pgm) built with **gmapping** package.

**[move_base](http://wiki.ros.org/move_base), [costmap_2d](http://wiki.ros.org/costmap_2d]) and other** packages from the [Navigation stack:](http://wiki.ros.org/turtlebot_navigation/Tutorials/Setup%20the%20Navigation%20Stack%20for%20TurtleBot) provides navigation abilities including setting navigation gaols, plan the path using variant of the Uniform Cost Search algorithm and folow the path to goal.

Localization with navigation can be tested using this [script](/catkin_ws/src/script/test_navigation.sh) 

**Finnaly, two custom nodes were implemented:**

**pick_object**: a node that will communicate with the ROS navigation stack and autonomously send successive goals for robot to reach.

**add_markers**: Simulating virtual objects with markers to provide fancy visualization for the picked object.


## Getting started

* Install ROS following [instructions](http://wiki.ros.org/kinetic/Installation)

* Install [TurtleBot](http://wiki.ros.org/action/fullsearch/Robots/TurtleBot?action=fullsearch&context=180&value=linkto%3A%22Robots%2FTurtleBot%22).  You can use [script](/catkin_ws/src/scripts/turtlebot_install.sh) provided to fully install turtlebot

* ```
clone https://github.com/alexeysas/rb-world
cd rb-world/home/catkin_ws
catkin_make
src/scripts/home_service.sh
```
