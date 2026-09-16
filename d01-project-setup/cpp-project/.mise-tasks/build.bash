#!/usr/bin/env bash

#MISE description="👷 Build the program | alias = build"
#MISE quiet=true

#______________________________________________________________________________

# STEP: 1 => Create a command to generate the build instructions

# This specifies that the build instructions should be generated for Ninja
GENERATOR=(-G Ninja)

# This specifies that `clang++` is the compiler that `Ninja` 
# should use to build the project
COMPILER=(-DCMAKE_CXX_COMPILER=clang++)

# This specifies where the build instructions should be saved
BUILD_DIR=(-B build)

# I've named it `GBI_COMMAND`, 
# which is short for `Generate Build Instructions`
GBI_COMMAND=(cmake "${GENERATOR[@]}" "${COMPILER[@]}" "${BUILD_DIR[@]}")


# GENERATOR = "-G Ninja"
# COMPILER = "-DCMAKE_CXX_COMPILER=clang++"
# BUILD_DIR = "-B build"

# So GBI_COMMAND=(cmake -G Ninja -DCMAKE_CXX_COMPILER=clang++ -B build)

#______________________________________________________________________________

# STEP: 2 => Generate the build instructions if they have not been generated

if [ ! -d "build" ]; then
    if ! build_instruction_error_message=$("${GBI_COMMAND[@]}" 2>&1); then
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



