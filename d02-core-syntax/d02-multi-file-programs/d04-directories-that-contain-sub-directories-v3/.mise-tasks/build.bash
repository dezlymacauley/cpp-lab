#!/usr/bin/env bash

#MISE description="👷 Build the program | alias = build"
#MISE quiet=true

#______________________________________________________________________________

# STEP: 1 => Create a command to generate the build instructions

# I've named it `GBI_COMMAND`, 
# which is short for `Generate Build Instructions`

GENERATOR=(-G Ninja)
COMPILER=(DCMAKE_CXX_COMPILER=clang++)

BUILD_GENERATION_COMMAND=(cmake -G Ninja -DCMAKE_CXX_COMPILER=clang++ -B build)

#______________________________________________________________________________

# STEP: 2 => Generate the build instructions if they have not been generated

if [ ! -d "build" ]; then
    if ! build_instruction_error_message=$(cmake -B build -G Ninja 2>&1); then
        printf "\n%s\n\n" '❌ Failed to generate build instructions:'
        printf "%s\n" "$build_instruction_error_message"
        exit 1
    fi
fi

#______________________________________________________________________________

# STEP: 3 => Build the project

if ! build_output_error_messages=$(cmake --build build 2>&1); then
    printf "\n%s\n\n" '❌ Failed to build project'
    printf "%s\n" "$build_output_error_messages"
    exit 1
fi

#______________________________________________________________________________

printf "\n%s\n\n" '✅ The program has been built'
