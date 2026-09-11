# STEP: 1 => Set the minimum version of `cmake` needed to run this file

cmake_minimum_required(VERSION 4.4.3)

#______________________________________________________________________________

# STEP: 2 => Set the project name and language used

# The first argument is the project name
# The second argument `LANGUAGES CXX`, 
# is used to specify that this project only uses C++
project(s01-single-file-programs LANGUAGES CXX)

#______________________________________________________________________________

# STEP: 3 => Set the C++ standard and ensure that it is enforced

# Sets the C++ standard that should be used to compile the project
set(CMAKE_CXX_STANDARD 20)

# Ensures that build failds if the compiler version does not support 
# the C++ standard that is set in this file
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#______________________________________________________________________________

# STEP: 4 => Create a name for the binary executable

# The first step is to create a name for each binary executable
# Each `.cpp` file will have a binary executable that is equal to the
# name without the extension.
# Eg. `s01_example_program.cpp` will be compiled to `s01_example_program`


# This creates a variable called name `NAME_OF_BINARY` 
# from variable calle CPP_FILE_PATH that will be set 
# in `.mise-tasks/build-file`.

# `NAME_WE` is used to get the name of the file, excluding 
# the .cpp extension

get_filename_component(NAME_OF_BINARY ${CPP_FILE_PATH} NAME_WE)


# E.g. If you use run the command: `mise dev src/s01/s01_alpha.cpp`

#______________________________________________________________________________

# This is a loop that will perform a set of actions for each C++ file 
# in the `src` directory
# foreach(CPP_FILE ${SRC_DIR})


    # The second step is to register the `.cpp` file, 
    # and the name that should be used to create its binary executable

    # The second step is to register the name of the binary executable, 
    # and the `.cpp` file that should be used to create it.
    # add_executable(${NAME_OF_BINARY} ${CPP_FILE})
# endforeach()

#______________________________________________________________________________
