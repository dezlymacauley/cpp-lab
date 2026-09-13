# Sets the minimum version of CMake that is required to use 
# this `CMakeLists.txt` file
# To figure out what version of CMake your project is using, run this command:
# cmake --version
cmake_minimum_required(VERSION 4.4.3)

# Sets the project name and lets CMake know that this project 
# only uses C++ code. 
project(cpp-project LANGUAGES CXX)

# This will create a binary executable called `cpp-single-file-workspace`,
# from `src/main.cpp`
add_executable(cpp-project "src/main.cpp")

# This is where you specify build settings.
# `PRIVATE cxx_std_17` tells CMake what C++ standard should 
# be used to build this specific binary.

# You can use the website below to view a list a valid C++ standards.
# I recommend using the second latest one unless you need a feature 
# from the latest one:
# https://www.cplusplus-language.org/
target_compile_features(cpp-project PRIVATE cxx_std_17)
