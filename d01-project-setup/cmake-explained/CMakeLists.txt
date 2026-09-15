# The minimum version of CMake needed to use this file
cmake_minimum_required(VERSION 4.4.3)

# `$ENV{PROJECT_NAME}` tells CMake that `PROJECT_NAME` is an environment
# variable. CMake will get the value of `PROJECT_NAME` 
# from the `[env]` section of the `mise.toml` file
# You could just write the project name directly like this
# project("cmake-explained" LANGUAGES CXX)
# But I prefer to use an environment variable so that if I ever change 
# the project name, I only need to update the `mise.toml` file.

# `LANGUAGES CXX` means that this project only used C++
project($ENV{PROJECT_NAME} LANGUAGES CXX)

# This will create a binary executable from `main.cpp`
# The name of the binaray executable will be whatever `PROJECT_NAME` 
# has been is set to in the `mise.toml` file
add_executable($ENV{PROJECT_NAME} main.cpp)
