#!/usr/bin/env bash

#MISE description="🚀 Run the project"
#MISE quiet=true

#______________________________________________________________________________

# STEP: 1 => Generate the build instructions

# If there was an error generating the build instructions, 
# it will be displayed. 
if ! build_instruction_error_message=$(cmake -B build -G Ninja 2>&1); then
    printf "\n%s\n\n" '❌ Failed to generate build instructions'
    printf "%s\n" "$build_instruction_error_message"
    exit 1
fi
#______________________________________________________________________________

# STEP: 2 => Build the project

# If there was an error building the project,
# it will be displayed. 
if ! build_output_error_messages=$(cmake --build build 2>&1); then
    printf "\n%s\n\n" '❌ Failed to build project'
    printf "%s\n" "$build_output_error_messages"
    exit 1
fi
#______________________________________________________________________________

# STEP: 3 => Run the project

./build/cpp_project
#______________________________________________________________________________
