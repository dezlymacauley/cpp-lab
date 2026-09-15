
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

# Tip: If you want to create a reusable `PROJECT_NAME` variable without
# having to rely on an environment variable, you can use the `set` keyword
# to declare it directly in this file like this:
# set(PROJECT_NAME d04-directories-that-contain-sub-directories-v2)

# Then use it like this:
# project(${PROJECT_NAME} LANGUAGES CXX)

# `LANGUAGES CXX` means that this project only uses C++
project($ENV{PROJECT_NAME} LANGUAGES CXX)
#______________________________________________________________________________

# This is where you list the directories of the project 
# that contain `.cpp` and `.hpp` files

# I've decided to place all the `.cpp` and `.hpp` files inside this directory
add_subdirectory(src)       
#______________________________________________________________________________
