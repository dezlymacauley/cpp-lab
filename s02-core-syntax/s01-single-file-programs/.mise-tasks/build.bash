#!/usr/bin/env bash

#MISE description="👷 Build the project"
#MISE quiet=true

cmake -B build -G Ninja
cmake --build build
