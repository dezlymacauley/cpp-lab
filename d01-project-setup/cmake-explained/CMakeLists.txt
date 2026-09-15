
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

# This is where you list the files that should be turned into libraries.
# A library is a file that is not meant to be used as a standalone
# binary executable. It is a file that is meant to be imported into a program.

# This will create a static library called `my_lib` from the `my_lib.cpp` file
add_library(my_lib STATIC my_lib.cpp)

# NOTE: This will not add `my_lib` to the program.
# It only creates a library that can be imported.
# Remember to link libraries to the programs that need to use them.

#______________________________________________________________________________

# This is where you list files that have to be turned into 
# a binary executable.

# This will create a binary executable from `main.cpp`
# The name of the binaray executable will be whatever `PROJECT_NAME` 
# has been is set to in the `mise.toml` file
add_executable($ENV{PROJECT_NAME} main.cpp)
#______________________________________________________________________________

# This is where you en

#______________________________________________________________________________
