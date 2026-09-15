# This is where you list the files that should be turned into libraries.
# A library is a file that is not meant to be used as a standalone
# binary executable. It is a file that is meant to be imported into a program.

# This will create a static library called `my_lib` from the `my_lib.cpp` file
add_library(my_lib STATIC my_lib.cpp)

# This tells CMake where to find the header file used by `my_lib`
# Since `my_lib.cpp` and `my_lib.hpp` are in the same directory.

# you can use `CMAKE_CURRENT_SOURCE_DIR` which is a built-in CMake variable
# that gives you the path of the current directory.

target_include_directories(
    my_lib PUBLIC 
    ${CMAKE_CURRENT_SOURCE_DIR}
)

# NOTE: This will not add `my_lib` to the program.
# It only creates a library that can be imported.
# Remember to link libraries to the programs that need to use them.

#______________________________________________________________________________
