# The minimum version of `cmake` needed to run this file
cmake_minimum_required(VERSION 4.4.3)

# The first argument is the project name
# The second argument `LANGUAGES CXX`, 
# is used to specify that this project only uses C++
project(s01-single-file-programs LANGUAGES CXX)

# Sets the C++ standard that should be used to compile the project
set(CMAKE_CXX_STANDARD 20)

# Ensures that build failds if the compiler version does not support 
# the C++ standard that is set in this file
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#______________________________________________________________________________

# SECTION: Working with a project that has multiple `.cpp` files

#______________________________________________________________________________

# Target all `.cpp` files in the `src` directory
file(GLOB_RECURSE SRC_DIR CONFIGURE_DEPENDS "src/*.cpp")

# `GLOB_RECURSE` tells CMake to perform a recursive check for `.cpp` files.
# In simple terms, CMake will also look for `.cpp` files inside 
# sub-directories in `src`

# `SRC_DIR` is a variable name that will be used by CMake to generate 
# # a list of the `.cpp` files in your project. 
# This variable can then be used in a `for each loop` to perform an action
# on each `.cpp` file in the project. 
# You can name `SRC_DIR` whatever you want.

# `CONFIGURE_DEPENDS` tells CMake to check if the file system 
# of the `src` directory has changed, and update the `SRC_DIR` variable.

# E.g. If new files and sub-directories have been added, 
# or if files and directories have been deleted or renamed.

#______________________________________________________________________________



#______________________________________________________________________________



# This will create a binary executable called `cpp_project`,
# using the source file `src/main.cpp`
# add_executable(cpp_project src/main.cpp)
