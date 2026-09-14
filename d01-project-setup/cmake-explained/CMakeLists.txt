# The minimum version of CMake needed to use this file
cmake_minimum_required(VERSION 4.4.3)

# The project name
# `LANGUAGES CXX` means that this project only used C++
project(cmake-explained LANGUAGES CXX)

# This will create a binary executable called `cmake-explained` from 
# the file `main.cpp`
add_executable(cmake-explained main.cpp)
