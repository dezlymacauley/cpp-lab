# C++ Single-File Program Workspace Setup Guide
_______________________________________________________________________________

### Create the project directory and enter it
_______________________________________________________________________________

```bash
mkdir cpp-single-file-program-workspace
cd cpp-single-file-program-workspace
```
_______________________________________________________________________________

Use `mise` to the set the project to use the latest version 
of `clang`, `clang-format`, `cmake`, and `ninja`
```bash
mise use clang@latest
mise use cmake@latest
mise use clang-format@latest
mise use ninja@latest
```

Note:
- `clang` a collection of tools for C and C++ project. 
It includes the `clang++` toolchaing that includes `clang++` C++ compiler
- `clang-format` is a formatter for C and C++ projects.
- `cmake` generates build instructions using a `CMakeLists.txt` file
- `ninja` executes the build instructions that CMake generated 
_______________________________________________________________________________

### Create the project structure

```bash
touch .gitignore
touch CMakeLists.txt

mkdir programs

mkdir programs/d01-topic-one
touch programs/d01-topic-one/f01_alpha.cpp
touch programs/d01-topic-one/f02_bravo.cpp

mkdir programs/d02-topic-two
touch programs/d02-topic-two/f01_charlie.cpp
touch programs/d02-topic-two/f02_delta.cpp

mkdir .mise-tasks 
touch .mise-tasks/build-file.bash 
touch .mise-tasks/clean.bash 
touch .mise-tasks/run-bin.bash 
chmod u+x .mise-tasks/*.bash
```
_______________________________________________________________________________

Add this to the `programs/d01-topic-one/f01_alpha.cpp` file
```cpp
#include <iostream>

int main() {

  std::cout << "\nThis is f01_alpha.cpp\n\n";

  return 0;
}
```
_______________________________________________________________________________

Add this to the `programs/d01-topic-one/f02_bravo.cpp` file
```cpp
#include <iostream>

int main() {

  std::cout << "\nThis is f02_bravo.cpp\n\n";

  return 0;
}
```
_______________________________________________________________________________

Add this to the `programs/d02-topic-two/f01_charlie.cpp` file
```cpp
#include <iostream>

int main() {

  std::cout << "\nThis is f01_charlie.cpp\n\n";

  return 0;
}
```
_______________________________________________________________________________

Add this to the `programs/d02-topic-two/f02_delta.cpp` file
```cpp
#include <iostream>

int main() {

  std::cout << "\nThis is f02_delta.cpp\n\n";

  return 0;
}
```
_______________________________________________________________________________

Add this to the `.gitignore` file
```bash
# Build Output
/build/
```
_______________________________________________________________________________

## Continue to update from Here

Add this to the `CMakeLists.txt` file
```cmake
cmake_minimum_required(VERSION 4.4.3)

project(cpp-single-file-workspace LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find all .cpp files recursively inside the programs directory
file(GLOB_RECURSE PROGRAM_SOURCES CONFIGURE_DEPENDS "programs/*.cpp")

foreach(SOURCE_FILE ${PROGRAM_SOURCES})
    # Extract filename without extension (e.g., f01_alpha)
    get_filename_component(TARGET_NAME ${SOURCE_FILE} NAME_WE)
    
    # Register each source file as its own standalone executable target
    add_executable(\({TARGET_NAME}\){SOURCE_FILE})
endforeach()
```
_______________________________________________________________________________

Add this to the `.mise-tasks/build.bash` file
```bash
#!/usr/bin/env bash

#MISE description="👷 Build the project"
#MISE quiet=true

#______________________________________________________________________________

# STEP: 1 => Generate the build instructions

# If there was an error generating the build instructions, 
# it will be displayed. 
if ! build_instruction_error_message=$(cmake -B build -G Ninja 2>&1); then
    printf "\n%s\n\n" '❌ Failed to generate build instructions'
    printf "%s\n" "$build_instruction_error_message"
    exit 1
fi

printf "\n%s\n" '✅ Build instructions generated'
#______________________________________________________________________________

# STEP: 2 => Build the project

# If there was an error building the project,
# it will be displayed. 
if ! build_output_error_messages=$(cmake --build build 2>&1); then
    printf "\n%s\n\n" '❌ Failed to build project'
    printf "%s\n" "$build_output_error_messages"
    exit 1
fi

printf "\n%s\n\n" '✅ Project built'
#______________________________________________________________________________
```
_______________________________________________________________________________

Add this to the `.mise-tasks/clean.bash` file
```bash
#!/usr/bin/env bash

#MISE description="🧼 Delete the 'build' directory"
#MISE quiet=true

if [ ! -d build ]; then
    printf "\n%s\n\n" '✅ No build directory found'
    exit 0
fi

rm -rf build
printf "\n%s\n\n" '✅ The build directory has been deleted'
```
_______________________________________________________________________________

Add this to the `.mise-tasks/dev.bash` file
```bash
#!/usr/bin/env bash

#MISE description="🚀 Run the project"
#MISE quiet=true

#______________________________________________________________________________

# STEP: 1 => Generate the build instructions

# If there was an error generating the build instructions, 
# it will be displayed. 
if ! build_instruction_error_message=$(cmake -B build -G Ninja 2>&1); then
    printf "\n%s\n\n" '❌ Failed to generate build instructions'
    printf "%s\n" "$build_instruction_error_message"
    exit 1
fi
#______________________________________________________________________________

# STEP: 2 => Build the project

# If there was an error building the project,
# it will be displayed. 
if ! build_output_error_messages=$(cmake --build build 2>&1); then
    printf "\n%s\n\n" '❌ Failed to build project'
    printf "%s\n" "$build_output_error_messages"
    exit 1
fi
#______________________________________________________________________________

# STEP: 3 => Run the project

./build/cpp_project
#______________________________________________________________________________
```
_______________________________________________________________________________

Add this to the end of the `mise.toml` file
```toml
[shell_alias]
build = "mise build-file"
run = "mise run-bin"
```

The full file should look like this:
```toml
[tools]
clang = "latest"
clang-format = "latest"
cmake = "latest"
ninja = "latest"

[shell_alias]
build = "mise build-file"
run = "mise run-bin"
```
_______________________________________________________________________________

### To view a list of `mise tasks`, run this command
```bash
mise tasks
```

You should get an output like this
```
```
_______________________________________________________________________________

### To build the program (Create an executable binary)

```bash
mise buildfile.bash
```

#### Note:
- CMake does not compile the program. It simply acts as a trigger to let 
the `ninja` program know that it should use the ninja-specific 
build instructions from the `build` directory, to build the program 
and create an executable binary.

- CMake is a build system generator. You create a `CMakeLists.txt` file
and it generates the build system for your compiler.
_______________________________________________________________________________

### Run the program (Run the executable binary)

```bash
mise dev
```
_______________________________________________________________________________
