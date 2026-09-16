# C++ Project Setup Guide
_______________________________________________________________________________

Create the project directory and enter it
```bash
mkdir cpp-project && cd cpp-project
```
_______________________________________________________________________________

Use `mise` to add the following tools to the project:
- `cmake`, `cmake-language-server`,
- `ninja`
- `clang++`, `clangd`, `clang-format`

```bash
mise use cmake@latest
mise use "pipx:cmake-language-server[uvx_args=--with pygls<2]@latest"

mise use ninja@latest

mise use conda:clangxx@latest
mise use github:clangd/clangd@latest
mise use clang-format@latest
```
_______________________________________________________________________________

#### Note:

##### `cmake`
- This is used to read `CMakeList.txt` files, 
generate build instructions for a specific build generator,
and then trigger that build generator to use a C++ compiler 
to build the project.

##### `cmake-language-server`
- This provides language support for `CMakeLists.txt` files
- This is a Python program so you install it with the `pipx:` prefix
which actually uses `uv` (A Rust-powered package manager) to install
it from PyPi (the Python repository)
- `[uvx_args=--with pygls<2]@latest` is needed 
because `cmake-language-server` does not support `pygls version 2 and above`

##### `ninja`
- This the build generator that will use a C++ compiler to build the project. 
- It is available on the mise registry, so no prefix is required

##### `clang++` 
- This is a compiler for C++
- the `conda:` prefix is used to download it from 
the Conda package repository

##### `clangd` 
- This provides language support for C and C++ files, including header files
- The `github:` prefix is used to download a pre-compiled binary from 
the official GitHub repository.

##### `clang-format` 
- This is a formatter for C++ and C files.
- It is available on the mise registry, so no prefix is required
_______________________________________________________________________________

Create the project structure

```bash
touch .gitignore CMakeLists.txt main.cpp 
mkdir .mise-tasks
touch .mise-tasks/build.bash
touch .mise-tasks/clean.bash
touch .mise-tasks/run-bin.bash
chmod +x .mise-tasks/*.bash
```

##### Note:
- You are not allowed to create a `.mise-tasks/run.bash` file because
`mise run` is a reserved command in `mise`, that's why I called it `run-bin`
_______________________________________________________________________________

This is the project structure
```
.
├── CMakeLists.txt
├── .gitignore
├── main.cpp
├── .mise-tasks
│   ├── build.bash
│   ├── clean.bash
│   └── run-bin.bash
└── mise.toml
```
_______________________________________________________________________________

Your `mise.toml` file should look like this now
```toml
[tools]
clang-format = "latest"
cmake = "latest"
"conda:clangxx" = "latest"
"github:clangd/clangd" = "latest"
ninja = "latest"
"pipx:cmake-language-server" = { version = "latest", uvx_args = "--with pygls<2" }
```
_______________________________________________________________________________

Update your `mise.toml` file to look like this
```toml
#______________________________________________________________________________

[tools]
# Project Dependencies
cmake = "latest"
ninja = "latest"
"conda:clangxx" = "latest"

# Development Dependencies
"github:clangd/clangd" = "latest"
clang-format = "latest"
"pipx:cmake-language-server" = { version = "latest", uvx_args = "--with pygls<2" }
#______________________________________________________________________________

[env]
PROJECT_NAME = "cpp-project"
GENERATOR = "Ninja"
COMPILER = "clang++"
BUILD_DIR = "build"
BINARY_NAME = "cpp-project"

# This is the command that will generate the build instructions
# To check if this works, run this:
# bash -c "$CMAKE_GBI_CMD"
CMAKE_GBI_CMD = """
cmake \
    -G {{env.GENERATOR}} \
    -DCMAKE_CXX_COMPILER={{env.COMPILER}} \
    -B {{env.BUILD_DIR}}
"""

# This is the command that will build the project
# To check if this works, run this:
# bash -c "$CMAKE_GBI_CMD"
# bash -c "$CMAKE_BUILD_CMD"
CMAKE_BUILD_CMD = """
cmake --build {{env.BUILD_DIR}}
"""

# This is the command that will run the binary
# To check if these work, run this:
# bash -c "$RUN_BINARY_CMD"
RUN_BINARY_CMD = "./{{env.BUILD_DIR}}/{{env.BINARY_NAME}}"
#______________________________________________________________________________

[shell_alias]
build = "mise build"
clean = "mise clean"
run = "mise run-bin"
#______________________________________________________________________________
```
_______________________________________________________________________________

Add this to the `CMakeLists.txt` file
```cmake
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

# Declares that a binary executable should be created from `main.cpp`
add_executable($ENV{BINARY_NAME} main.cpp)
```
_______________________________________________________________________________

Add this to the `.gitignore` file
```bash
# Build Output
/build/
```
_______________________________________________________________________________

Add this to the `main.cpp` file
```cpp
#include <iostream>

int main() {
    std::cout << "\nC++ Project\n\n";

    return 0;
}
```
_______________________________________________________________________________

Add this to the `.mise-tasks/build.bash` file
```bash
#!/usr/bin/env bash

#MISE description="👷 Build the project | alias = build"
#MISE quiet=true

#______________________________________________________________________________

# STEP: 1 => Generate the build instructions 

# The first `if` block ensures that CMake will only generate 
# build instructions if the `build` directory does not exist.

if [ ! -d "build" ]; then

    # This creates a clean cli output because the output messages from
    # the `CMAKE_GBI_CMD` command will only be shown if an error occured
    # when generating the the build instructions.
    if ! build_instruction_error_messages=$($CMAKE_GBI_CMD 2>&1); then
        printf "\n%s\n\n" '❌ Failed to generate build instructions:'
        printf "%s\n" "$build_instruction_error_messages"
        exit 1
    fi

fi

#______________________________________________________________________________

# STEP: 2 => Build the project

# This creates a clean cli output because the output messages from
# the `CMAKE_BUILD_CMD` command will only be shown if an error occured
# when building the project.
if ! build_output_error_messages=$($CMAKE_BUILD_CMD 2>&1); then
    printf "\n%s\n\n" '❌ Failed to build project'
    printf "%s\n" "$build_output_error_messages"
    exit 1
fi

#______________________________________________________________________________

printf "\n%s\n\n" '✅ All programs in the workspace have been built'
#______________________________________________________________________________
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

```
_______________________________________________________________________________
