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

# A link to the latest CPM 
set(
    LATEST_CPM
    https://github.com/CPM-cmake/CPM.cmake/releases/latest/download/CPM.cmake
)

# Specifies where the CPM package manager will be saved.
# `CMAKE_SOURCE_DIR` is a built-in variable CMake variable. 
# Its value is set the the absolute path to of the project
# You can this to create a relative path
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

# SECTION: Download external packages

# If you want to search for C and C++ packages, you have two options:

# 1. You can search on Conan Center (my prefered choice):
# https://conan.io/center

# 2. Or you can search the Vcpkg registry:
# https://vcpkg.io/en/packages

# Note that Conan and Vcpkg are both package managers,
# that are unrelated to CPM. 

# The syntax for adding a package is:
# CPMAddPackage(
#   "<Source prefix>:<username or organization name>/<package name>@<version>"
# )

# E.g. The GitHub repo for the nlohmann_json package is:
# https://github.com/nlohmann/json

# So you add it like this: 
# CPMAddPackage("gh:nlohmann/json@3.12.0")

# CPMAddPackage("gh:nlohmann/json@3.12.0")

#______________________________________________________________________________

# For working with JSON data
CPMAddPackage(
    NAME nlohmann_json
    VERSION 3.12.0
    URL https://github.com/nlohmann/json/releases/download/v3.12.0/json.tar.xz
)

#______________________________________________________________________________

# SECTION: Declaring what internal files should be compiled

# Declares that a binary executable should be created from `src/main.cpp`
add_executable($ENV{BINARY_NAME} src/main.cpp)
#______________________________________________________________________________
