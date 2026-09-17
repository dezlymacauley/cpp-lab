# SECTION: Environment Variables

# The following environment variables are declared in the `mise.toml` file:
# PROJECT_NAME
# BINARY_NAME

#______________________________________________________________________________

# SECTION: Basic Settings

# The minimum version of CMake required to create build instructions
# in this project
cmake_minimum_required(VERSION 4.4.3)

project($ENV{PROJECT_NAME} LANGUAGES CXX)
#______________________________________________________________________________

# SECTION: Package Manager Setup

# A link to the latest latest CPM 
set(
    LATEST_CPM
    https://github.com/CPM-cmake/CPM.cmake/releases/latest/download/CPM.cmake
)

# Specifies where the CPM package manager will be saved.
# `CMAKE_SOURCE_DIR` is a built-in variable CMake variable 
# that is used to a relative path from the project root.
set(
    CPM_DOWNLOAD_LOCATION
    "${CMAKE_SOURCE_DIR}/cmake/CPM.cmake"
)

# Download the latest CPM.cmake if it isn't already available,
# and ensure that the connection is secure.
if(NOT EXISTS ${CPM_DOWNLOAD_LOCATION})
    file(
        DOWNLOAD
        ${LATEST_CPM}
        ${CPM_DOWNLOAD_LOCATION}
        TLS_VERIFY ON
    )
endif()

# This tells CMake to add CPM's functionality to the project
include(${CPM_DOWNLOAD_LOCATION})

#______________________________________________________________________________

# SECTION: Declaring what files should be compiled

# Sets the project name, and specifies that this project uses C++
project($ENV{PROJECT_NAME} LANGUAGES CXX)

# Declares that a binary executable should be created from `src/main.cpp`
add_executable($ENV{BINARY_NAME} src/main.cpp)
#______________________________________________________________________________
