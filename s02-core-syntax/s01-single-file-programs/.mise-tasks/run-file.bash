#!/usr/bin/env bash

#MISE description="🚀 Build and run a specific C++ file"
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

# STEP: 2: Store the name of the binary executable in a variable

# E.g. If you use run the command: `mise dev src/s01/s01_alpha.cpp`
# Then `NAME_OF_BINARY` will be set to `s01_alpha`

# `basename "$1" .cpp`, will extract the file name from the file path, 
# and remove the `.cpp` part of the file name

NAME_OF_BINARY=$(basename "$1" .cpp)

#______________________________________________________________________________

# STEP: 3: Generate the build 


# Use cmake to read the `CMakeLists.txt` file and generate build
# instructions for `Ninja` in the `build` directory of the project

# The variable `PROJECT_ROOT` is set in the `mise.toml` file
cmake -B "$PROJECT_ROOT/build" -G Ninja &>/dev/null

#______________________________________________________________________________

# STEP: 4: Build the project

# if ! BUILD_OUTPUT=$(cmake --build "$PROJECT_ROOT/build" --target "$NAME_OF_BINARY" 2>&1); then
#     printf "\n%s\n\n" "❌ Error: $NAME_OF_BINARY could not be built"
#     printf "%s\n\n" "$BUILD_OUTPUT"
#     exit 1
# fi

# cmake -B build -G Ninja

# This will check if a binary executable could be built
# if ! mise build &>/dev/null; then
#
#     printf "\n%s\n\n" "❌ Error: $NAME_OF_BINARY could not be built"
#     
#     # If the build fails run `mise build` again so 
#     # the that compiler errors are visible
#     mise build
#
#     exit 1
# fi

# if ! BUILD_OUTPUT=$(mise run build 2>&1); then
#     printf "\n%s\n\n" "❌ Error: $NAME_OF_BINARY could not be built"
#     printf "%s\n\n" "$BUILD_OUTPUT"
#     exit 1
# fi


# Use the `PROJECT_ROOT` variable that was set in the `mise.toml` file,
# to run the binary that is in the build directory
# "$PROJECT_ROOT/build/$NAME_OF_BINARY"
