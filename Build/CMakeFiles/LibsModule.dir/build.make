# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/katy/programming/git/terrain/test

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/katy/programming/git/terrain/test/Build

# Include any dependencies generated for this target.
include CMakeFiles/LibsModule.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/LibsModule.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/LibsModule.dir/flags.make

CMakeFiles/LibsModule.dir/main.cpp.o: CMakeFiles/LibsModule.dir/flags.make
CMakeFiles/LibsModule.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/katy/programming/git/terrain/test/Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/LibsModule.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/LibsModule.dir/main.cpp.o -c /home/katy/programming/git/terrain/test/main.cpp

CMakeFiles/LibsModule.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LibsModule.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/katy/programming/git/terrain/test/main.cpp > CMakeFiles/LibsModule.dir/main.cpp.i

CMakeFiles/LibsModule.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LibsModule.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/katy/programming/git/terrain/test/main.cpp -o CMakeFiles/LibsModule.dir/main.cpp.s

# Object files for target LibsModule
LibsModule_OBJECTS = \
"CMakeFiles/LibsModule.dir/main.cpp.o"

# External object files for target LibsModule
LibsModule_EXTERNAL_OBJECTS =

libLibsModule.a: CMakeFiles/LibsModule.dir/main.cpp.o
libLibsModule.a: CMakeFiles/LibsModule.dir/build.make
libLibsModule.a: CMakeFiles/LibsModule.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/katy/programming/git/terrain/test/Build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libLibsModule.a"
	$(CMAKE_COMMAND) -P CMakeFiles/LibsModule.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/LibsModule.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/LibsModule.dir/build: libLibsModule.a

.PHONY : CMakeFiles/LibsModule.dir/build

CMakeFiles/LibsModule.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/LibsModule.dir/cmake_clean.cmake
.PHONY : CMakeFiles/LibsModule.dir/clean

CMakeFiles/LibsModule.dir/depend:
	cd /home/katy/programming/git/terrain/test/Build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/katy/programming/git/terrain/test /home/katy/programming/git/terrain/test /home/katy/programming/git/terrain/test/Build /home/katy/programming/git/terrain/test/Build /home/katy/programming/git/terrain/test/Build/CMakeFiles/LibsModule.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/LibsModule.dir/depend

