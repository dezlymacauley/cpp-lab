# SECTION: Environment Variables

# The following environment variables are declared in the `mise.toml` file:
# PROJECT_NAME
# BINARY_NAME

#______________________________________________________________________________

# SECTION: Basic Settings

# The minimum version of CMake required to create build instructions
# in this project
cmake_minimum_required(VERSION 4.4.3)

# Sets the project name, and specifies that this project uses C++
project($ENV{PROJECT_NAME} LANGUAGES CXX)

#______________________________________________________________________________

# SECTION: Declaring the files that should be compiled

# This will create a library called `my_lib` from the `my_lib.cpp` file
add_library(my_lib STATIC my_lib.cpp)

# Declares that a binary executable should be created from `main.cpp`
add_executable($ENV{BINARY_NAME} main.cpp)

#______________________________________________________________________________

# SECTION: Adding compiled libraries to the program

# The will add the library `my_lib` to the program
target_link_libraries($ENV{BINARY_NAME} PUBLIC my_lib)

#______________________________________________________________________________
