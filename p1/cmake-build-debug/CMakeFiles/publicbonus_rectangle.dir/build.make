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
include CMakeFiles/publicbonus_rectangle.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/publicbonus_rectangle.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/publicbonus_rectangle.dir/flags.make

CMakeFiles/publicbonus_rectangle.dir/tests/publicbonus_rectangle.cpp.o: CMakeFiles/publicbonus_rectangle.dir/flags.make
CMakeFiles/publicbonus_rectangle.dir/tests/publicbonus_rectangle.cpp.o: ../tests/publicbonus_rectangle.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/publicbonus_rectangle.dir/tests/publicbonus_rectangle.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/publicbonus_rectangle.dir/tests/publicbonus_rectangle.cpp.o -c "/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1/tests/publicbonus_rectangle.cpp"

CMakeFiles/publicbonus_rectangle.dir/tests/publicbonus_rectangle.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/publicbonus_rectangle.dir/tests/publicbonus_rectangle.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1/tests/publicbonus_rectangle.cpp" > CMakeFiles/publicbonus_rectangle.dir/tests/publicbonus_rectangle.cpp.i

CMakeFiles/publicbonus_rectangle.dir/tests/publicbonus_rectangle.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/publicbonus_rectangle.dir/tests/publicbonus_rectangle.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1/tests/publicbonus_rectangle.cpp" -o CMakeFiles/publicbonus_rectangle.dir/tests/publicbonus_rectangle.cpp.s

# Object files for target publicbonus_rectangle
publicbonus_rectangle_OBJECTS = \
"CMakeFiles/publicbonus_rectangle.dir/tests/publicbonus_rectangle.cpp.o"

# External object files for target publicbonus_rectangle
publicbonus_rectangle_EXTERNAL_OBJECTS =

publicbonus_rectangle: CMakeFiles/publicbonus_rectangle.dir/tests/publicbonus_rectangle.cpp.o
publicbonus_rectangle: CMakeFiles/publicbonus_rectangle.dir/build.make
publicbonus_rectangle: CMakeFiles/publicbonus_rectangle.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1/cmake-build-debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable publicbonus_rectangle"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/publicbonus_rectangle.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/publicbonus_rectangle.dir/build: publicbonus_rectangle

.PHONY : CMakeFiles/publicbonus_rectangle.dir/build

CMakeFiles/publicbonus_rectangle.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/publicbonus_rectangle.dir/cmake_clean.cmake
.PHONY : CMakeFiles/publicbonus_rectangle.dir/clean

CMakeFiles/publicbonus_rectangle.dir/depend:
	cd "/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1/cmake-build-debug" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1" "/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1" "/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1/cmake-build-debug" "/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1/cmake-build-debug" "/Users/NEW/Desktop/Spring 2019/CS401/cs401workspace/p1/cmake-build-debug/CMakeFiles/publicbonus_rectangle.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/publicbonus_rectangle.dir/depend

