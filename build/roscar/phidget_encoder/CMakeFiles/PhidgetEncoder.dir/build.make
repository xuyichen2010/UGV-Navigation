# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/nuccar/roscar_2018/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/nuccar/roscar_2018/build

# Include any dependencies generated for this target.
include roscar/phidget_encoder/CMakeFiles/PhidgetEncoder.dir/depend.make

# Include the progress variables for this target.
include roscar/phidget_encoder/CMakeFiles/PhidgetEncoder.dir/progress.make

# Include the compile flags for this target's objects.
include roscar/phidget_encoder/CMakeFiles/PhidgetEncoder.dir/flags.make

roscar/phidget_encoder/CMakeFiles/PhidgetEncoder.dir/src/PhidgetEncoder.cpp.o: roscar/phidget_encoder/CMakeFiles/PhidgetEncoder.dir/flags.make
roscar/phidget_encoder/CMakeFiles/PhidgetEncoder.dir/src/PhidgetEncoder.cpp.o: /home/nuccar/roscar_2018/src/roscar/phidget_encoder/src/PhidgetEncoder.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/nuccar/roscar_2018/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object roscar/phidget_encoder/CMakeFiles/PhidgetEncoder.dir/src/PhidgetEncoder.cpp.o"
	cd /home/nuccar/roscar_2018/build/roscar/phidget_encoder && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/PhidgetEncoder.dir/src/PhidgetEncoder.cpp.o -c /home/nuccar/roscar_2018/src/roscar/phidget_encoder/src/PhidgetEncoder.cpp

roscar/phidget_encoder/CMakeFiles/PhidgetEncoder.dir/src/PhidgetEncoder.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/PhidgetEncoder.dir/src/PhidgetEncoder.cpp.i"
	cd /home/nuccar/roscar_2018/build/roscar/phidget_encoder && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/nuccar/roscar_2018/src/roscar/phidget_encoder/src/PhidgetEncoder.cpp > CMakeFiles/PhidgetEncoder.dir/src/PhidgetEncoder.cpp.i

roscar/phidget_encoder/CMakeFiles/PhidgetEncoder.dir/src/PhidgetEncoder.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/PhidgetEncoder.dir/src/PhidgetEncoder.cpp.s"
	cd /home/nuccar/roscar_2018/build/roscar/phidget_encoder && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/nuccar/roscar_2018/src/roscar/phidget_encoder/src/PhidgetEncoder.cpp -o CMakeFiles/PhidgetEncoder.dir/src/PhidgetEncoder.cpp.s

# Object files for target PhidgetEncoder
PhidgetEncoder_OBJECTS = \
"CMakeFiles/PhidgetEncoder.dir/src/PhidgetEncoder.cpp.o"

# External object files for target PhidgetEncoder
PhidgetEncoder_EXTERNAL_OBJECTS =

/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: roscar/phidget_encoder/CMakeFiles/PhidgetEncoder.dir/src/PhidgetEncoder.cpp.o
/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: roscar/phidget_encoder/CMakeFiles/PhidgetEncoder.dir/build.make
/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: /opt/ros/kinetic/lib/libroscpp.so
/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: /usr/lib/i386-linux-gnu/libboost_filesystem.so
/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: /usr/lib/i386-linux-gnu/libboost_signals.so
/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: /opt/ros/kinetic/lib/librosconsole.so
/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: /opt/ros/kinetic/lib/librosconsole_log4cxx.so
/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: /opt/ros/kinetic/lib/librosconsole_backend_interface.so
/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: /usr/lib/i386-linux-gnu/liblog4cxx.so
/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: /usr/lib/i386-linux-gnu/libboost_regex.so
/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: /opt/ros/kinetic/lib/libroscpp_serialization.so
/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: /opt/ros/kinetic/lib/libxmlrpcpp.so
/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: /opt/ros/kinetic/lib/librostime.so
/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: /opt/ros/kinetic/lib/libcpp_common.so
/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: /usr/lib/i386-linux-gnu/libboost_system.so
/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: /usr/lib/i386-linux-gnu/libboost_thread.so
/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: /usr/lib/i386-linux-gnu/libboost_chrono.so
/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: /usr/lib/i386-linux-gnu/libboost_date_time.so
/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: /usr/lib/i386-linux-gnu/libboost_atomic.so
/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: /usr/lib/i386-linux-gnu/libpthread.so
/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: /usr/lib/i386-linux-gnu/libconsole_bridge.so
/home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so: roscar/phidget_encoder/CMakeFiles/PhidgetEncoder.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/nuccar/roscar_2018/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library /home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so"
	cd /home/nuccar/roscar_2018/build/roscar/phidget_encoder && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/PhidgetEncoder.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
roscar/phidget_encoder/CMakeFiles/PhidgetEncoder.dir/build: /home/nuccar/roscar_2018/devel/lib/libPhidgetEncoder.so

.PHONY : roscar/phidget_encoder/CMakeFiles/PhidgetEncoder.dir/build

roscar/phidget_encoder/CMakeFiles/PhidgetEncoder.dir/clean:
	cd /home/nuccar/roscar_2018/build/roscar/phidget_encoder && $(CMAKE_COMMAND) -P CMakeFiles/PhidgetEncoder.dir/cmake_clean.cmake
.PHONY : roscar/phidget_encoder/CMakeFiles/PhidgetEncoder.dir/clean

roscar/phidget_encoder/CMakeFiles/PhidgetEncoder.dir/depend:
	cd /home/nuccar/roscar_2018/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/nuccar/roscar_2018/src /home/nuccar/roscar_2018/src/roscar/phidget_encoder /home/nuccar/roscar_2018/build /home/nuccar/roscar_2018/build/roscar/phidget_encoder /home/nuccar/roscar_2018/build/roscar/phidget_encoder/CMakeFiles/PhidgetEncoder.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : roscar/phidget_encoder/CMakeFiles/PhidgetEncoder.dir/depend

