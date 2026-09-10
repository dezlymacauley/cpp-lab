#!/usr/bin/env bash

#MISE description="🚀 Run a C++ file"
#MISE quiet=true

# This will check if a C++ file was specified
if [ -z "$1" ]; then
    printf "\n%s\n\n" '❌ Error: You did not specify which C++ file to run'
    printf "%s\n" 'Usage: mise dev file_name.cpp'
    printf "%s\n\n" 'mise dev file_name.cpp'
    
    printf "%s\n" '💡Tip: Use the run alias'
    printf "%s\n\n" 'run file_name.cpp'
    exit 1
fi

# Gets the name of the binary by removing the .cpp extension
NAME_OF_BINARY=$(basename "$1" .cpp)

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

if ! BUILD_OUTPUT=$(mise run build 2>&1); then
    printf "\n%s\n\n" "❌ Error: $NAME_OF_BINARY could not be built"
    printf "%s\n\n" "$BUILD_OUTPUT"
    exit 1
fi


# Use the `PROJECT_ROOT` variable that was set in the `mise.toml` file,
# to run the binary that is in the build directory
"$PROJECT_ROOT/build/$NAME_OF_BINARY"
