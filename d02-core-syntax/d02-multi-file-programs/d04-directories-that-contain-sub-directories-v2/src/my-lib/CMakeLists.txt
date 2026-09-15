# This is where you list the files that should be turned into libraries.
# A library is a file that is not meant to be used as a standalone
# binary executable. It is a file that is meant to be imported into a program.

# This will create a static library called `my_lib` from the `my_lib.cpp` file
add_library(my_lib STATIC my_lib.cpp)

# This tells CMake where to find the header files used by `my_lib`
# `PROJECT_SOURCE_DIR` is a built-in CMake variable that gives 
# you an absolute path to the root of the project, 
# to make it easier to create relative paths.
target_include_directories(
    my_lib PUBLIC 
    ${PROJECT_SOURCE_DIR}/include/my-lib
)

# NOTE: This will not add `my_lib` to the program.
# It only creates a library that can be imported.
# Remember to link libraries to the programs that need to use them.

#______________________________________________________________________________
