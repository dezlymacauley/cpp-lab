# SECTION: Environment Variables

# The following environment variables are declared in the `mise.toml` file:
# PROJECT_NAME
# BINARY_NAME

#______________________________________________________________________________

# The minimum version of CMake required to create build instructions
# in this project
cmake_minimum_required(VERSION 4.4.3)

# Sets the project name, and specifies that this project uses C++
project($ENV{PROJECT_NAME} LANGUAGES CXX)

# Declares that a binary executable should be created from `src/main.cpp`
add_executable($ENV{BINARY_NAME} src/main.cpp)
