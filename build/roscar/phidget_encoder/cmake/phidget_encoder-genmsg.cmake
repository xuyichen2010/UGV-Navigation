# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "phidget_encoder: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iphidget_encoder:/home/nuccar/roscar_2018/src/roscar/phidget_encoder/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(phidget_encoder_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/phidget_encoder/msg/Ticks.msg" NAME_WE)
add_custom_target(_phidget_encoder_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "phidget_encoder" "/home/nuccar/roscar_2018/src/roscar/phidget_encoder/msg/Ticks.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(phidget_encoder
  "/home/nuccar/roscar_2018/src/roscar/phidget_encoder/msg/Ticks.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/phidget_encoder
)

### Generating Services

### Generating Module File
_generate_module_cpp(phidget_encoder
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/phidget_encoder
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(phidget_encoder_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(phidget_encoder_generate_messages phidget_encoder_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/phidget_encoder/msg/Ticks.msg" NAME_WE)
add_dependencies(phidget_encoder_generate_messages_cpp _phidget_encoder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(phidget_encoder_gencpp)
add_dependencies(phidget_encoder_gencpp phidget_encoder_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS phidget_encoder_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(phidget_encoder
  "/home/nuccar/roscar_2018/src/roscar/phidget_encoder/msg/Ticks.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/phidget_encoder
)

### Generating Services

### Generating Module File
_generate_module_eus(phidget_encoder
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/phidget_encoder
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(phidget_encoder_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(phidget_encoder_generate_messages phidget_encoder_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/phidget_encoder/msg/Ticks.msg" NAME_WE)
add_dependencies(phidget_encoder_generate_messages_eus _phidget_encoder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(phidget_encoder_geneus)
add_dependencies(phidget_encoder_geneus phidget_encoder_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS phidget_encoder_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(phidget_encoder
  "/home/nuccar/roscar_2018/src/roscar/phidget_encoder/msg/Ticks.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/phidget_encoder
)

### Generating Services

### Generating Module File
_generate_module_lisp(phidget_encoder
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/phidget_encoder
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(phidget_encoder_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(phidget_encoder_generate_messages phidget_encoder_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/phidget_encoder/msg/Ticks.msg" NAME_WE)
add_dependencies(phidget_encoder_generate_messages_lisp _phidget_encoder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(phidget_encoder_genlisp)
add_dependencies(phidget_encoder_genlisp phidget_encoder_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS phidget_encoder_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(phidget_encoder
  "/home/nuccar/roscar_2018/src/roscar/phidget_encoder/msg/Ticks.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/phidget_encoder
)

### Generating Services

### Generating Module File
_generate_module_nodejs(phidget_encoder
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/phidget_encoder
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(phidget_encoder_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(phidget_encoder_generate_messages phidget_encoder_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/phidget_encoder/msg/Ticks.msg" NAME_WE)
add_dependencies(phidget_encoder_generate_messages_nodejs _phidget_encoder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(phidget_encoder_gennodejs)
add_dependencies(phidget_encoder_gennodejs phidget_encoder_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS phidget_encoder_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(phidget_encoder
  "/home/nuccar/roscar_2018/src/roscar/phidget_encoder/msg/Ticks.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/phidget_encoder
)

### Generating Services

### Generating Module File
_generate_module_py(phidget_encoder
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/phidget_encoder
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(phidget_encoder_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(phidget_encoder_generate_messages phidget_encoder_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/phidget_encoder/msg/Ticks.msg" NAME_WE)
add_dependencies(phidget_encoder_generate_messages_py _phidget_encoder_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(phidget_encoder_genpy)
add_dependencies(phidget_encoder_genpy phidget_encoder_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS phidget_encoder_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/phidget_encoder)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/phidget_encoder
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(phidget_encoder_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/phidget_encoder)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/phidget_encoder
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(phidget_encoder_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/phidget_encoder)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/phidget_encoder
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(phidget_encoder_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/phidget_encoder)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/phidget_encoder
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(phidget_encoder_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/phidget_encoder)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/phidget_encoder\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/phidget_encoder
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(phidget_encoder_generate_messages_py std_msgs_generate_messages_py)
endif()
