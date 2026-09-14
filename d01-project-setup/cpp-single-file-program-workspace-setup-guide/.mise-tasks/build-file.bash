#!/usr/bin/env bash

#MISE description="👷 Build a specific .cpp file | alias = build"
#MISE quiet=true

#______________________________________________________________________________

# STEP: 1 => Create a name for the binary

if [ -z "$1" ]; then
    printf "\n%s\n" '❌ Error:'
    printf "%s\n\n" 'You did not specify which .cpp file to build'
    printf "%s\n" 'Usage:'
    printf "%s\n\n" 'mise build-file f01_alpha.cpp'
    exit 1
fi

BINARY_NAME=$(basename "$1" .cpp)
#______________________________________________________________________________

# STEP: 2 => Generate the build instructions if they have not been generated

if [ ! -d "build" ]; then
    if ! cmake -B build -G Ninja &> /dev/null; then
        printf "\n%s\n\n" '❌ Failed to generate build instructions'
        exit 1
    fi
fi
#______________________________________________________________________________

# STEP: 3 => Build the specific file

if ! cmake --build build --target "$BINARY_NAME" &> /dev/null; then
    printf "\n%s\n\n" "❌ Failed to build target: $BINARY_NAME"
    exit 1
fi
#______________________________________________________________________________

printf "\n%s\n\n" "✅ $BINARY_NAME has been built"
