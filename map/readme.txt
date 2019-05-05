cd /home/workspace/rb_world/map/catkin_ws

roslaunch my_robot3 world.launch

####rosrun teleop_twist_keyboard teleop_twist_keyboard.py
roslaunch my_robot3 teleop.launch


roslaunch my_robot3 mapping.launch


rtabmap-databaseViewer ~/.ros/rtabmap.db



export GAZEBO_MODEL_PATH=~/workspace/rb-world/map/catkin_ws/src/my_robot3/models:$GAZEBO_MODEL_PATH


export GAZEBO_MODEL_PATH=~/Downloads/furniture:$GAZEBO_MODEL_PATH
export GAZEBO_MODEL_PATH=~/Downloads/electronics:$GAZEBO_MODEL_PATH

