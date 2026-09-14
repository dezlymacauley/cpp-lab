# Sets the minimum version of CMake that is required to use 
# this `CMakeLists.txt` file
# To figure out what version of CMake your project is using, run this command:
# cmake --version
cmake_minimum_required(VERSION 4.4.3)

# Sets the project name and lets CMake know that this project 
# only uses C++ code. 
project(cpp-single-file-workspace LANGUAGES CXX)

# This line is used to create a list of all the `.cpp` files in the project
# that should be built, and then store 
# that list as a variable that I have chosen to call `PROGRAMS_DIRECTORY`.

# `GLOB_RECURSE` and `"programs/*.cpp"` tell CMake 
# to search for all `.cpp` files inside the "programs" directory,
# including any sub-directories that contain `.cpp` files.

# `CONFIGURE_DEPENDS` tells CMake to check the file system of the project 
# for changes before building the project. So if you add, delete, or rename,
# things inside the `programs` directory,
# CMake will ensure that the variable `PROGRAMS_DIRECTORY` is updated.
file(GLOB_RECURSE PROGRAMS_DIRECTORY CONFIGURE_DEPENDS "programs/*.cpp")

# This is a `foreach` loop in CMake.
# It allows CMAKE to to perform a set of actions for each `.cpp` file in the
# the `programs` directory.
foreach(CPP_FILE ${PROGRAMS_DIRECTORY})

    # A `.cpp` file is built, a binary executable is created.
    # The line below allows you to set the name of the binary executable
    # in advance, and store it in a variable called `BINARY_NAME`.
    # `${CPP_FILE} NAME_WE` means that the `BINARY_NAME` is equal to the C++ file
    # without the extension.
    # So if CPP_FILE = f01_alpha.cpp, and BINARY_NAME = f01_alpha
    get_filename_component(BINARY_NAME ${CPP_FILE} NAME_WE)

    # This is where you list what should be built and from which `.cpp` file
    # E.g. Build `f01_alpha` from `f01_alpha.cpp`
    add_executable(${BINARY_NAME} ${CPP_FILE})
    
    # This is where you specify build settings.
    # `PRIVATE cxx_std_17` tells CMake what C++ standard should 
    # be used to build this specific binary.

    # You can use the website below to view a list a valid C++ standards.
    # I recommend using the second latest one unless you need a feature 
    # from the latest one:
    # https://www.cplusplus-language.org/
    target_compile_features(${BINARY_NAME} PRIVATE cxx_std_17)

endforeach()
