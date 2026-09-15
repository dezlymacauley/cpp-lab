# This is where you list the files that should be turned into libraries.
# A library is a file that is not meant to be used as a standalone
# binary executable. It is a file that is meant to be imported into a program.

# This will create a static library called `my_lib` from the `my_lib.cpp` file
add_library(my_lib STATIC my_lib.cpp)

# NOTE: This will not add `my_lib` to the program.
# It only creates a library that can be imported.
# Remember to link libraries to the programs that need to use them.

#______________________________________________________________________________

# This this where you list the relative path 
# to the header files (the .hpp files) that allow other parts of the program 
# such as `app/main.cpp` to import this library.

target_include_directories(my_lib PUBLIC "./")

#______________________________________________________________________________
