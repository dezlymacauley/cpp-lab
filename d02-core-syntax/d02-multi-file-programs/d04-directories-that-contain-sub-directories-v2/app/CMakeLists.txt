
# This is where you list files that have to be turned into 
# a binary executable.

# This will create a binary executable from `main.cpp`
# The name of the binaray executable will be whatever `PROJECT_NAME` 
# has been is set to in the `mise.toml` file
add_executable($ENV{PROJECT_NAME} main.cpp)
#______________________________________________________________________________

# This is where you link libraries to the program

# This will add the `my_lib` library to the program
# `PRIVATE` tells CMake that `my_lib` is only used by the program.
# This is the correct setting because the program `$ENV{PROJECT_NAME}` is
# a binary executable and is not meant to be imported into another program.
target_link_libraries($ENV{PROJECT_NAME} PRIVATE my_lib)
#______________________________________________________________________________
