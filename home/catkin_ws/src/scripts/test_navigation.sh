#!/bin/sh
DIRECTORY=$(cd `dirname $0` && pwd)
BASE_DIR="$(dirname "$(dirname $DIRECTORY)")"
SETUP_BASH="$BASE_DIR/devel/setup.bash"
WORLD_FILE="$BASE_DIR/src/map/world.world"
MODELS_DIR="$BASE_DIR/src/models"

xterm  -e  " source $SETUP_BASH; roslaunch $BASE_DIR/src/turtlebot_simulator/turtlebot_gazebo/launch/turtlebot_world.launch world_file:=$WORLD_FILE models:=$MODELS_DIR; read" &
sleep 5
xterm  -e  " source $SETUP_BASH; roslaunch $BASE_DIR/src/turtlebot_simulator/turtlebot_gazebo/launch/amcl_demo.launch map_file:=$BASE_DIR/src/map/my_map.yaml" &
sleep 5
xterm  -e  " source $SETUP_BASH; roslaunch $BASE_DIR/src/turtlebot_interactions/turtlebot_rviz_launchers/launch/view_navigation.launch"