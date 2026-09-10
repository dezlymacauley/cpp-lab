#!/usr/bin/env bash

#MISE description="👷 Build a specific C++ file"
#MISE quiet=true

#______________________________________________________________________________

# STEP: 1: Check if a C++ file path was specified

if [ -z "$1" ]; then
    printf "\n%s\n\n" '❌ Error: You did not specify which C++ file to run'
    printf "%s\n" 'Usage: mise dev file_name.cpp'
    printf "%s\n\n" 'mise dev file_name.cpp'
    
    printf "%s\n" '💡Tip: Use the run alias'
    printf "%s\n\n" 'run file_name.cpp'
    exit 1
fi

#______________________________________________________________________________

# STEP: 2: Extract the file name fom the file path

# E.g. If you use run the command: `mise dev src/s01/s01_alpha.cpp`
# Then `NAME_OF_BINARY` will be set to `s01_alpha`

# `basename "$1" .cpp`, will extract the file name from the file path, 
# and remove the `.cpp` part of the file name

NAME_OF_BINARY=$(basename "$1" .cpp)

#______________________________________________________________________________

# STEP: 3: Generate the build instructions

# Use cmake to read the `CMakeLists.txt` file and generate build
# instructions for `Ninja` in the `build` directory of the project

# The variable `PROJECT_ROOT` is set in the `mise.toml` file
cmake -B "$PROJECT_ROOT/build" -G Ninja &>/dev/null

#______________________________________________________________________________

# STEP: 4: Build the project

# cmake --build build

#______________________________________________________________________________
