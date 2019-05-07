#!/bin/bash

echo 
echo WARNING - Please do NOT run as superuser - some permissions may get skewed if you do
echo 
echo BUT - Parts of this script may request superuser password.
echo 
echo WARNING - Parts of this script may be interactive - I put these bits at the end.
echo 
echo WARNING - This script causes ubuntu to upgrade.
echo 
echo WARNING - If this script does not end with \"ROS Kinetic Turtlebot install with extra packages was successful.\", it means that the installation did not finish.
echo
echo NOTE: To make this script install extra cool robots - Hector, Nao, Husky - uncomment out the extra lines and rerun it \( not tested since ROS Kinetic \)
echo 
echo Press enter to proceed
read temp

echo Adding ROS repos...
# add ros
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu xenial main" > /etc/apt/sources.list.d/ros-latest.list'

echo Getting key for ROS....
# add ros keys
wget --ca-certificate=/etc/ssl/certs/DigiCert_High_Assurance_EV_Root_CA.pem https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add - # for some reason wget does not pick the right certificate on some installations - not on mine! On mine it is very very smart.
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add - 

echo Asking APT to download the latest source list....
# update APT
sudo apt-get -y update || { echo "could not update APT - do you have an internet connection?"; exit 1; }

echo Asking APT to upgrade what it has not yet upgraded
# upgrade what is there
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

echo Now installing all the extra packages that we want - including ROS

#for building, version control and starting IDE (kdevelop)

echo Now installing basic development tools - I

sudo apt-get -y install build-essential || { echo "Could not install some basic dependencies."; exit 1; }

echo Now installing basic development tools - II

sudo apt-get -y install git gitk git-cola mercurial tortoisehg dos2unix kdevelop || { echo "Could not install some dependencies."; exit 1; }

sudo apt-get -y install python-rosinstall python-wstool || { echo "Could not install some dependencies."; exit 1; }

echo Now installing basic ROS packages
#start installing ROS
sudo apt-get -y install ros-kinetic-ros-base  || { echo "Could not install basic ROS packages."; exit 1;}

echo Now installing basic ROS visualisers

sudo apt-get -y install ros-kinetic-desktop  || { echo "Could not install basic ROS visualisers"; exit 1;}

echo Now installing basic ROS simulation

sudo apt-get -y install ros-kinetic-gazebo-plugins || { echo "Could not install ROS simulation"; exit 1;}

echo Now installing basic ROS navigation

sudo apt-get -y install ros-kinetic-navigation || { echo "Could not install ROS navigation"; exit 1;}

echo Now installing basic ROS desktop

sudo apt-get -y install ros-kinetic-desktop-full  || { echo "Could not install ROS full desktop"; exit 1;}
echo Now installing basic ROS turtlebot packages
#core BLG456E (assignments)
sudo apt-get -y install ros-kinetic-turtlebot-gazebo ros-kinetic-desktop-full ros-kinetic-turtlebot-rviz-launchers  ros-kinetic-warehouse-ros  || { echo "Could not install main turtlebot packages."; exit 1;}

echo Now installing some extra packages

sudo apt-get -y install  ros-kinetic-gazebo-ros ros-kinetic-gazebo-plugins ros-kinetic-gazebo-ros-control python-rosdep python-wstool ros-kinetic-ros ros-kinetic-warehouse-ros libspnav-dev || { echo "Could not install some extra ROS packages."; exit 1;}

# sudo apt-get -y install ros-kinetic-depthimage-to-laserscan  ros-kinetic-slam-gmapping ros-kinetic-map-server ros-kinetic-costmap-2d ros-kinetic-move-base ros-kinetic-amcl ros-kinetic-navigation ros-kinetic-trajectory-msgs  || { echo "Could not install some extra ROS packages."; exit 1;}

# sudo apt-get -y install ros-kinetic-pcl-ros ros-kinetic-perception-pcl || exit 1  || { echo "Could not install some extra ROS packages."; exit 1;}

# extra BLG456E robot simulations
# sudo apt-get -y install ros-kinetic-katana-description ros-kinetic-katana-arm-gazebo ros-kinetic-katana-tutorials || exit 1
# 
# sudo apt-get -y install ros-kinetic-hector-gazebo-worlds ros-kinetic-hector-gazebo-plugins ros-kinetic-hector-gazebo ros-kinetic-hector-slam ros-kinetic-hector-localization ros-kinetic-hector-mapping || exit 1
# 
# sudo apt-get -y install ros-kinetic-husky-simulator ros-kinetic-husky-navigation ros-kinetic-husky-viz ros-kinetic-husky-control || exit 1
# 
# sudo apt-get -y install ros-kinetic-nao-meshes ros-kinetic-nao-teleop ros-kinetic-nao-gazebo-plugin || exit 1 #accept agreement for Nao meshes

echo Doing some ROS cleanup

sudo rosdep init
rosdep update || exit 1

echo "----------------------------------------------"
echo "----------------------------------------------"
echo ROS Kinetic Turtlebot install with extra packages finished.
echo "----------------------------------------------"
echo "----------------------------------------------"

exit 0
