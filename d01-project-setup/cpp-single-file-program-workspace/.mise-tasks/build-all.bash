#!/usr/bin/env bash

#MISE description="👷 Build all programs in the workspace"
#MISE quiet=true

#______________________________________________________________________________

# STEP: 1 => Generate the build instructions

if ! build_instruction_error_message=$(cmake -B build -G Ninja 2>&1); then
    printf "\n%s\n\n" '❌ Failed to generate build instructions:'
    printf "%s\n" "$build_instruction_error_message"
    exit 1
fi

#______________________________________________________________________________

# STEP: 2 => Build the project

if ! build_output_error_messages=$(cmake --build build 2>&1); then
    printf "\n%s\n\n" '❌ Failed to build project'
    printf "%s\n" "$build_output_error_messages"
    exit 1
fi

#______________________________________________________________________________

printf "\n%s\n\n" '✅ All programs in the workspace have been built'
