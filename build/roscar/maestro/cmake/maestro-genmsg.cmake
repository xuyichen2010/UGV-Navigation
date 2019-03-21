# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "maestro: 3 messages, 0 services")

set(MSG_I_FLAGS "-Imaestro:/home/nuccar/roscar_2018/src/roscar/maestro/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(maestro_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroOut.msg" NAME_WE)
add_custom_target(_maestro_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "maestro" "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroOut.msg" ""
)

get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroIn.msg" NAME_WE)
add_custom_target(_maestro_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "maestro" "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroIn.msg" ""
)

get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/maestro/msg/VelAndAngle.msg" NAME_WE)
add_custom_target(_maestro_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "maestro" "/home/nuccar/roscar_2018/src/roscar/maestro/msg/VelAndAngle.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(maestro
  "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroOut.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/maestro
)
_generate_msg_cpp(maestro
  "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroIn.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/maestro
)
_generate_msg_cpp(maestro
  "/home/nuccar/roscar_2018/src/roscar/maestro/msg/VelAndAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/maestro
)

### Generating Services

### Generating Module File
_generate_module_cpp(maestro
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/maestro
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(maestro_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(maestro_generate_messages maestro_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroOut.msg" NAME_WE)
add_dependencies(maestro_generate_messages_cpp _maestro_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroIn.msg" NAME_WE)
add_dependencies(maestro_generate_messages_cpp _maestro_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/maestro/msg/VelAndAngle.msg" NAME_WE)
add_dependencies(maestro_generate_messages_cpp _maestro_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(maestro_gencpp)
add_dependencies(maestro_gencpp maestro_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS maestro_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(maestro
  "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroOut.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/maestro
)
_generate_msg_eus(maestro
  "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroIn.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/maestro
)
_generate_msg_eus(maestro
  "/home/nuccar/roscar_2018/src/roscar/maestro/msg/VelAndAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/maestro
)

### Generating Services

### Generating Module File
_generate_module_eus(maestro
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/maestro
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(maestro_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(maestro_generate_messages maestro_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroOut.msg" NAME_WE)
add_dependencies(maestro_generate_messages_eus _maestro_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroIn.msg" NAME_WE)
add_dependencies(maestro_generate_messages_eus _maestro_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/maestro/msg/VelAndAngle.msg" NAME_WE)
add_dependencies(maestro_generate_messages_eus _maestro_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(maestro_geneus)
add_dependencies(maestro_geneus maestro_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS maestro_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(maestro
  "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroOut.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/maestro
)
_generate_msg_lisp(maestro
  "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroIn.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/maestro
)
_generate_msg_lisp(maestro
  "/home/nuccar/roscar_2018/src/roscar/maestro/msg/VelAndAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/maestro
)

### Generating Services

### Generating Module File
_generate_module_lisp(maestro
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/maestro
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(maestro_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(maestro_generate_messages maestro_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroOut.msg" NAME_WE)
add_dependencies(maestro_generate_messages_lisp _maestro_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroIn.msg" NAME_WE)
add_dependencies(maestro_generate_messages_lisp _maestro_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/maestro/msg/VelAndAngle.msg" NAME_WE)
add_dependencies(maestro_generate_messages_lisp _maestro_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(maestro_genlisp)
add_dependencies(maestro_genlisp maestro_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS maestro_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(maestro
  "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroOut.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/maestro
)
_generate_msg_nodejs(maestro
  "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroIn.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/maestro
)
_generate_msg_nodejs(maestro
  "/home/nuccar/roscar_2018/src/roscar/maestro/msg/VelAndAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/maestro
)

### Generating Services

### Generating Module File
_generate_module_nodejs(maestro
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/maestro
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(maestro_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(maestro_generate_messages maestro_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroOut.msg" NAME_WE)
add_dependencies(maestro_generate_messages_nodejs _maestro_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroIn.msg" NAME_WE)
add_dependencies(maestro_generate_messages_nodejs _maestro_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/maestro/msg/VelAndAngle.msg" NAME_WE)
add_dependencies(maestro_generate_messages_nodejs _maestro_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(maestro_gennodejs)
add_dependencies(maestro_gennodejs maestro_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS maestro_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(maestro
  "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroOut.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/maestro
)
_generate_msg_py(maestro
  "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroIn.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/maestro
)
_generate_msg_py(maestro
  "/home/nuccar/roscar_2018/src/roscar/maestro/msg/VelAndAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/maestro
)

### Generating Services

### Generating Module File
_generate_module_py(maestro
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/maestro
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(maestro_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(maestro_generate_messages maestro_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroOut.msg" NAME_WE)
add_dependencies(maestro_generate_messages_py _maestro_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/maestro/msg/MaestroIn.msg" NAME_WE)
add_dependencies(maestro_generate_messages_py _maestro_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/nuccar/roscar_2018/src/roscar/maestro/msg/VelAndAngle.msg" NAME_WE)
add_dependencies(maestro_generate_messages_py _maestro_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(maestro_genpy)
add_dependencies(maestro_genpy maestro_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS maestro_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/maestro)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/maestro
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(maestro_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/maestro)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/maestro
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(maestro_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/maestro)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/maestro
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(maestro_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/maestro)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/maestro
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(maestro_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/maestro)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/maestro\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/maestro
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(maestro_generate_messages_py std_msgs_generate_messages_py)
endif()
