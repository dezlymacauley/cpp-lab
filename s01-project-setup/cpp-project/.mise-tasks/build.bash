#!/usr/bin/env bash

#MISE description="👷 Build the project"
#MISE quiet=true

#______________________________________________________________________________

# STEP: 1 => Generate the build instructions

if ! cmake -B build -G Ninja; then
    printf "\n%s\n\n"  '❌ Failed to generate build instructions'
    exit 1
fi

printf "\n%s\n\n" '✅ Build instructions generated'
#______________________________________________________________________________

# STEP: 2 => Generate the build instructions

if ! cmake --build build; then
    printf "\n%s\n\n"  '❌ Failed to build project'
    exit 1
fi

printf "\n%s\n\n" '✅ Project built'
#______________________________________________________________________________
