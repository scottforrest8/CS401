# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

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
CMAKE_COMMAND = "/Users/NEW/Library/Application Support/JetBrains/Toolbox/apps/CLion/ch-0/183.5429.37/CLion.app/Contents/bin/cmake/mac/bin/cmake"

# The command to remove a file.
RM = "/Users/NEW/Library/Application Support/JetBrains/Toolbox/apps/CLion/ch-0/183.5429.37/CLion.app/Contents/bin/cmake/mac/bin/cmake" -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1/cmake-build-debug"

# Include any dependencies generated for this target.
include CMakeFiles/public_1000000.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/public_1000000.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/public_1000000.dir/flags.make

CMakeFiles/public_1000000.dir/tests/public_1000000.cpp.o: CMakeFiles/public_1000000.dir/flags.make
CMakeFiles/public_1000000.dir/tests/public_1000000.cpp.o: ../tests/public_1000000.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/public_1000000.dir/tests/public_1000000.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/public_1000000.dir/tests/public_1000000.cpp.o -c "/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1/tests/public_1000000.cpp"

CMakeFiles/public_1000000.dir/tests/public_1000000.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/public_1000000.dir/tests/public_1000000.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1/tests/public_1000000.cpp" > CMakeFiles/public_1000000.dir/tests/public_1000000.cpp.i

CMakeFiles/public_1000000.dir/tests/public_1000000.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/public_1000000.dir/tests/public_1000000.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1/tests/public_1000000.cpp" -o CMakeFiles/public_1000000.dir/tests/public_1000000.cpp.s

# Object files for target public_1000000
public_1000000_OBJECTS = \
"CMakeFiles/public_1000000.dir/tests/public_1000000.cpp.o"

# External object files for target public_1000000
public_1000000_EXTERNAL_OBJECTS =

public_1000000: CMakeFiles/public_1000000.dir/tests/public_1000000.cpp.o
public_1000000: CMakeFiles/public_1000000.dir/build.make
public_1000000: CMakeFiles/public_1000000.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable public_1000000"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/public_1000000.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/public_1000000.dir/build: public_1000000

.PHONY : CMakeFiles/public_1000000.dir/build

CMakeFiles/public_1000000.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/public_1000000.dir/cmake_clean.cmake
.PHONY : CMakeFiles/public_1000000.dir/clean

CMakeFiles/public_1000000.dir/depend:
	cd "/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1/cmake-build-debug" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1" "/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1" "/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1/cmake-build-debug" "/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1/cmake-build-debug" "/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1/cmake-build-debug/CMakeFiles/public_1000000.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/public_1000000.dir/depend
