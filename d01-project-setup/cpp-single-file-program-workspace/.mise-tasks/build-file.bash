#!/usr/bin/env bash

#MISE description="👷 Build a specific .cpp file target"
#MISE quiet=true

if [ -z "$1" ]; then
    printf "\n%s\n" '❌ Error:'
    printf "%s\n\n" 'You did not specify which .cpp file to build'
    printf "%s\n" 'Usage:'
    printf "%s\n\n" 'mise buildbin f01_alpha.cpp'
    exit 1
fi

BINARY_NAME=$(basename "$1" .cpp)

if ! build_instruction_error_message=$(cmake -B build -G Ninja 2>&1); then
    printf "\n%s\n\n" '❌ Failed to generate build instructions:'
    printf "%s\n" "$build_instruction_error_message"
    exit 1
fi

if ! build_output_error_messages=$(cmake --build build --target "$BINARY_NAME" 2>&1); then
    printf "\n%s\n\n" "❌ Failed to build target: $BINARY_NAME"
    printf "%s\n" "$build_output_error_messages"
    exit 1
fi

printf "\n%s\n\n" "✅ $BINARY_NAME has been built"
