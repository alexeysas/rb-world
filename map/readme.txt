cd /home/workspace/rb_world/map/catkin_ws

roslaunch my_robot3 world.launch

rosrun teleop_twist_keyboard teleop_twist_keyboard.py

roslaunch my_robot3 mapping.launch


rtabmap-databaseViewer ~/.ros/rtabmap.db
