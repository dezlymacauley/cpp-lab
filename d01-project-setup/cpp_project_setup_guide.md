# C++ Project Setup Guide
_______________________________________________________________________________

### Create the project directory and enter it
_______________________________________________________________________________

```bash
mkdir cpp-project-setup-guide
cd cpp-project-setup-guide
```
_______________________________________________________________________________

Use `mise` to the set the project to use the latest version 
of `clang`, `clang-format`, `cmake`, and `ninja`
```bash
mise use clang@latest
mise use clang-format@latest
mise use cmake@latest
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

mkdir src
touch src/main.cpp

mkdir .mise-tasks 
touch .mise-tasks/build-all.bash 
touch .mise-tasks/clean.bash 
touch .mise-tasks/run-bin.bash 
chmod u+x .mise-tasks/*.bash
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

Add this to the `.gitignore` file
```bash
# Build Output
/build/
```
_______________________________________________________________________________

Add this to the `CMakeLists.txt` file
```cmake
# Sets the minimum version of CMake that is required to use 
# this `CMakeLists.txt` file
# To figure out what version of CMake your project is using, run this command:
# cmake --version
cmake_minimum_required(VERSION 4.4.3)

# Sets the project name and lets CMake know that this project 
# only uses C++ code. 
project(cpp-single-file-workspace LANGUAGES CXX)

# This line is used to create a list of all the `.cpp` files in the project
# that should be built, and then store 
# that list as a variable that I have chosen to call `SRC_DIRECTORY`.

# `GLOB_RECURSE` and `"src/*.cpp"` tell CMake 
# to search for all `.cpp` files inside the "src" directory,
# including any sub-directories that contain `.cpp` files.

# `CONFIGURE_DEPENDS` tells CMake to check the file system of the project 
# for changes before building the project. So if you add, delete, or rename,
# things inside the `src` directory,
# CMake will ensure that the variable `SRC_DIRECTORY` is updated.
file(GLOB_RECURSE SRC_DIRECTORY CONFIGURE_DEPENDS "src/*.cpp")

# This is a `foreach` loop in CMake.
# It allows CMAKE to to perform a set of actions for each `.cpp` file in the
# the `src` directory.
foreach(CPP_FILE ${SRC_DIRECTORY})

    # A `.cpp` file is built, a binary executable is created.
    # The line below allows you to set the name of the binary executable
    # in advance, and store it in a variable called `BINARY_NAME`.
    # `${CPP_FILE} NAME_WE` means that the `BINARY_NAME` is equal to the C++ file
    # without the extension.
    # So if CPP_FILE = f01_alpha.cpp, and BINARY_NAME = f01_alpha
    get_filename_component(BINARY_NAME ${CPP_FILE} NAME_WE)

    # This is where you list what should be built and from which `.cpp` file
    # E.g. Build `f01_alpha` from `f01_alpha.cpp`
    add_executable(${BINARY_NAME} ${CPP_FILE})
    
    # This is where you specify build settings.
    # `PRIVATE cxx_std_17` tells CMake what C++ standard should 
    # be used to build this specific binary.

    # You can use the website below to view a list a valid C++ standards.
    # I recommend using the second latest one unless you need a feature 
    # from the latest one:
    # https://www.cplusplus-language.org/
    target_compile_features(${BINARY_NAME} PRIVATE cxx_std_17)

endforeach()
```
_______________________________________________________________________________

### Add this to the `.mise-tasks/build-all.bash` file
```bash
#!/usr/bin/env bash

#MISE description="👷 Build the project | alias = build"
#MISE quiet=true

#______________________________________________________________________________

# STEP: 1 => Generate the build instructions if they have not been generated

if [ ! -d "build" ]; then
    if ! build_instruction_error_message=$(cmake -B build -G Ninja 2>&1); then
        printf "\n%s\n\n" '❌ Failed to generate build instructions:'
        printf "%s\n" "$build_instruction_error_message"
        exit 1
    fi
fi

#______________________________________________________________________________

# STEP: 2 => Build the project

if ! build_output_error_messages=$(cmake --build build 2>&1); then
    printf "\n%s\n\n" '❌ Failed to build project'
    printf "%s\n" "$build_output_error_messages"
    exit 1
fi

#______________________________________________________________________________

printf "\n%s\n\n" '✅ All programs in the workspace have been built'
```
_______________________________________________________________________________

Add this to the `.mise-tasks/clean.bash` file
```bash
#!/usr/bin/env bash

#MISE description="🧼 Delete the 'build' directory | alias = clean"
#MISE quiet=true

if [ ! -d build ]; then
    printf "\n%s\n\n" '✅ No build directory found'
    exit 0
fi

rm -rf build
printf "\n%s\n\n" '✅ The build directory has been deleted'
```
_______________________________________________________________________________

Add this to the `.mise-tasks/run-bin.bash` file
```bash
#!/usr/bin/env bash

#MISE description="🤖 Run the binary of the project | alias = run"
#MISE quiet=true

#______________________________________________________________________________

# STEP: 1 => Generate the build instructions if they have not been generated

if [ ! -d "build" ]; then
    if ! build_instruction_error_message=$(cmake -B build -G Ninja 2>&1); then
        printf "\n%s\n\n" '❌ Failed to generate build instructions:'
        printf "%s\n" "$build_instruction_error_message"
        exit 1
    fi
fi

#______________________________________________________________________________

# STEP: 2 => Build the project

if ! build_output_error_messages=$(cmake --build build 2>&1); then
    printf "\n%s\n\n" '❌ Failed to build project'
    printf "%s\n" "$build_output_error_messages"
    exit 1
fi

#______________________________________________________________________________

# STEP: 3 => Run the binary

./build/main
```
_______________________________________________________________________________

Add this to the end of the `mise.toml` file
```toml
[shell_alias]
build = "mise build-all"
clean = "mise clean"
run = "mise run-bin"
```
_______________________________________________________________________________

The full `mise.toml` file should look like this:
```toml
[tools]
clang = "latest"
clang-format = "latest"
cmake = "latest"
ninja = "latest"

[shell_alias]
build = "mise build-all"
clean = "mise clean"
run = "mise run-bin"
```
_______________________________________________________________________________

### To view a list of `mise tasks`, run this command
```bash
mise tasks
```

You should get an output like this
```
Name       Description
build-all  👷 Build the project | alias build
clean      🧼 Delete the 'build' directory | alias = clean
run-bin    🤖 Run the binary of the project | alias = run
```
_______________________________________________________________________________
