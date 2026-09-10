# The minimum version of `cmake` needed to run this file
zzzcmake_minimum_required(VERSION 4.4.3)

# The first argument is the project name
# The second argument `LANGUAGES CXX`, 
# is used to specify that this project only uses C++
project(cpp-project LANGUAGES CXX)

# Sets the C++ standard that should be used to compile the project
set(CMAKE_CXX_STANDARD 20)

# Ensures that build failds if the compiler version does not support 
# the C++ standard that is set in this file
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# This will create a binary executable called `cpp_project`,
# using the source file `src/main.cpp`

# Registers the name of the binary executable, 
# and the  `.cpp` file that should be used to create it.
add_executable(cpp_project src/main.cpp)
