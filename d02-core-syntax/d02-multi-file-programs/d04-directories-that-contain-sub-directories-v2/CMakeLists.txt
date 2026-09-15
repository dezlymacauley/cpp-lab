
# The minimum version of CMake needed to use this file
cmake_minimum_required(VERSION 4.4.3)
#______________________________________________________________________________

# `$ENV{PROJECT_NAME}` tells CMake that `PROJECT_NAME` is an environment
# variable. CMake will get the value of `PROJECT_NAME` 
# from the `[env]` section of the `mise.toml` file
# You could just write the project name directly like this
# project("cmake-explained" LANGUAGES CXX)
# But I prefer to use an environment variable so that if I ever change 
# the project name, I only need to update the `mise.toml` file.

# `LANGUAGES CXX` means that this project only used C++
project($ENV{PROJECT_NAME} LANGUAGES CXX)
#______________________________________________________________________________

# This is where you list the directories of the project 
# that contain `.cpp` and `.hpp` files

# Library code

# This contains the `.cpp` files for building the library
add_subdirectory(src)       

# This contains the `.hpp` files for making the library available 
# in the program
add_subdirectory(include)   

# This conatian the `.cpp` file for building the binary executable
add_subdirectory(app)
#______________________________________________________________________________
