#!/usr/bin/env bash

#MISE description="🤖 Run the binary of a .cpp file | alias = run"
#MISE quiet=true

#______________________________________________________________________________

# STEP: 1 => Create a name for the binary

if [ -z "$1" ]; then
    printf "\n%s\n" '❌ Error:'
    printf "%s\n\n" 'You did not specify which .cpp file to build'
    printf "%s\n" 'Usage:'
    printf "%s\n\n" 'mise buildbin f01_alpha.cpp'
    exit 1
fi

BINARY_NAME=$(basename "$1" .cpp)
#______________________________________________________________________________

# STEP: 2 => Generate the build instructions

if ! build_instruction_error_message=$(cmake -B build -G Ninja 2>&1); then
    printf "\n%s\n\n" '❌ Failed to generate build instructions:'
    printf "%s\n" "$build_instruction_error_message"
    exit 1
fi
#______________________________________________________________________________

# STEP: 3 => Build the project

if ! build_output_error_messages=$(cmake --build build --target "$BINARY_NAME" 2>&1); then
    printf "\n%s\n\n" "❌ Failed to build target: $BINARY_NAME"
    printf "%s\n" "$build_output_error_messages"
    exit 1
fi
#______________________________________________________________________________

# STEP: 4 => Run the project

./build/"$BINARY_NAME"
#______________________________________________________________________________
