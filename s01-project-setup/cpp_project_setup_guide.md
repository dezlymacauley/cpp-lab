# C++ Project Setup Guide
_______________________________________________________________________________

Create the project directory and enter it
```bash
mkdir cpp-project && cd cpp-project 
```
_______________________________________________________________________________

Use `mise` to the set the project to use the latest version 
of `clang`, `cmake`, and `ninja`
```bash
mise use clang@latest
mise use cmake@latest
mise use ninja@latest
```

Note:
- `clang` a collection of tools for C and C++ project. 
It includes the `clang++` toolchaing that includes `clang++` C++ compiler

- `cmake` generates build instructions using a `CMakeLists.txt` file
- `ninja` executes the build instructions that CMake generated 
_______________________________________________________________________________

Create the project structure
```bash
touch .gitignore
touch CMakeLists.txt
mkdir src && touch src/main.cpp
```
_______________________________________________________________________________

Add this to the `.gitignore` file
```bash
# Build Output
/build/
```
_______________________________________________________________________________

Add this to the `CMakeLists.txt` file
```cmake
# The minimum version of `cmake` needed to run this file
cmake_minimum_required(VERSION 4.4.3)

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
add_executable(cpp_project src/main.cpp)
```
_______________________________________________________________________________

Add this to the `src/main.cpp` file
```cpp
#include <iostream>

int main() {
    std::cout << "\nC++ Project\n\n";
    return 0;
}
```
_______________________________________________________________________________
