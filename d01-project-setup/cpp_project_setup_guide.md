# C++ Project Setup Guide
_______________________________________________________________________________

### Create the project directory and enter it
_______________________________________________________________________________

```bash
mkdir cpp-project
cd cpp-project
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

./build/cpp-project
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
