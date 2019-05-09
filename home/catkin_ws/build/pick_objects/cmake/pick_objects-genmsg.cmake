# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "pick_objects: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ipick_objects:/home/asas/workspace/rb-world/home/catkin_ws/src/pick_objects/msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(pick_objects_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/asas/workspace/rb-world/home/catkin_ws/src/pick_objects/msg/RobotAction.msg" NAME_WE)
add_custom_target(_pick_objects_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pick_objects" "/home/asas/workspace/rb-world/home/catkin_ws/src/pick_objects/msg/RobotAction.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(pick_objects
  "/home/asas/workspace/rb-world/home/catkin_ws/src/pick_objects/msg/RobotAction.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pick_objects
)

### Generating Services

### Generating Module File
_generate_module_cpp(pick_objects
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pick_objects
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(pick_objects_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(pick_objects_generate_messages pick_objects_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/asas/workspace/rb-world/home/catkin_ws/src/pick_objects/msg/RobotAction.msg" NAME_WE)
add_dependencies(pick_objects_generate_messages_cpp _pick_objects_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pick_objects_gencpp)
add_dependencies(pick_objects_gencpp pick_objects_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pick_objects_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(pick_objects
  "/home/asas/workspace/rb-world/home/catkin_ws/src/pick_objects/msg/RobotAction.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pick_objects
)

### Generating Services

### Generating Module File
_generate_module_eus(pick_objects
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pick_objects
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(pick_objects_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(pick_objects_generate_messages pick_objects_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/asas/workspace/rb-world/home/catkin_ws/src/pick_objects/msg/RobotAction.msg" NAME_WE)
add_dependencies(pick_objects_generate_messages_eus _pick_objects_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pick_objects_geneus)
add_dependencies(pick_objects_geneus pick_objects_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pick_objects_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(pick_objects
  "/home/asas/workspace/rb-world/home/catkin_ws/src/pick_objects/msg/RobotAction.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pick_objects
)

### Generating Services

### Generating Module File
_generate_module_lisp(pick_objects
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pick_objects
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(pick_objects_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(pick_objects_generate_messages pick_objects_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/asas/workspace/rb-world/home/catkin_ws/src/pick_objects/msg/RobotAction.msg" NAME_WE)
add_dependencies(pick_objects_generate_messages_lisp _pick_objects_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pick_objects_genlisp)
add_dependencies(pick_objects_genlisp pick_objects_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pick_objects_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(pick_objects
  "/home/asas/workspace/rb-world/home/catkin_ws/src/pick_objects/msg/RobotAction.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pick_objects
)

### Generating Services

### Generating Module File
_generate_module_nodejs(pick_objects
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pick_objects
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(pick_objects_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(pick_objects_generate_messages pick_objects_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/asas/workspace/rb-world/home/catkin_ws/src/pick_objects/msg/RobotAction.msg" NAME_WE)
add_dependencies(pick_objects_generate_messages_nodejs _pick_objects_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pick_objects_gennodejs)
add_dependencies(pick_objects_gennodejs pick_objects_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pick_objects_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(pick_objects
  "/home/asas/workspace/rb-world/home/catkin_ws/src/pick_objects/msg/RobotAction.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pick_objects
)

### Generating Services

### Generating Module File
_generate_module_py(pick_objects
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pick_objects
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(pick_objects_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(pick_objects_generate_messages pick_objects_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/asas/workspace/rb-world/home/catkin_ws/src/pick_objects/msg/RobotAction.msg" NAME_WE)
add_dependencies(pick_objects_generate_messages_py _pick_objects_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pick_objects_genpy)
add_dependencies(pick_objects_genpy pick_objects_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pick_objects_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pick_objects)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pick_objects
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pick_objects)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pick_objects
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pick_objects)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pick_objects
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pick_objects)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pick_objects
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pick_objects)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pick_objects\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pick_objects
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
