# Install script for directory: /home/nuccar/roscar_2018/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/nuccar/roscar_2018/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/nuccar/roscar_2018/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/nuccar/roscar_2018/install" TYPE PROGRAM FILES "/home/nuccar/roscar_2018/build/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/nuccar/roscar_2018/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/nuccar/roscar_2018/install" TYPE PROGRAM FILES "/home/nuccar/roscar_2018/build/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/nuccar/roscar_2018/install/setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/nuccar/roscar_2018/install" TYPE FILE FILES "/home/nuccar/roscar_2018/build/catkin_generated/installspace/setup.bash")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/nuccar/roscar_2018/install/setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/nuccar/roscar_2018/install" TYPE FILE FILES "/home/nuccar/roscar_2018/build/catkin_generated/installspace/setup.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/nuccar/roscar_2018/install/setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/nuccar/roscar_2018/install" TYPE FILE FILES "/home/nuccar/roscar_2018/build/catkin_generated/installspace/setup.zsh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/nuccar/roscar_2018/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/nuccar/roscar_2018/install" TYPE FILE FILES "/home/nuccar/roscar_2018/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/nuccar/roscar_2018/build/gtest/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/navigation/navigation/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/roscar/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/roscar_launch/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/phidget_encoder/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/phidget_gps/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/phidget_spatial/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/maestro/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/point_cloud/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/navigation/map_server/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/controller/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/bag_utilities/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/realsense/realsense2_camera/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/navigation/amcl/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/navigation/fake_localization/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/navigation_goals/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/odometry/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/utm_laser/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/planner/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/navigation/voxel_grid/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/navigation/costmap_2d/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/navigation/nav_core/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/navigation/base_local_planner/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/navigation/carrot_planner/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/navigation/clear_costmap_recovery/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/navigation/dwa_local_planner/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/navigation/move_slow_and_clear/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/navigation/navfn/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/navigation/global_planner/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/navigation/rotate_recovery/cmake_install.cmake")
  include("/home/nuccar/roscar_2018/build/roscar/navigation/move_base/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/nuccar/roscar_2018/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
