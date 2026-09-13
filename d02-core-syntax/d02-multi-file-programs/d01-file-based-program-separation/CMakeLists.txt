# Sets the minimum version of CMake that is required to use 
# this `CMakeLists.txt` file
# To figure out what version of CMake your project is using, run this command:
# cmake --version
cmake_minimum_required(VERSION 4.4.3)

# Sets the project name and lets CMake know that this project 
# only uses C++ code. 
project(d01-file-based-program-separation LANGUAGES CXX)

# This line is used to create a list of all the `.cpp` files in the project
# that should be built, and then store 
# that list as a variable that I have chosen to call `SRC_DIRECTORY`.

# `GLOB_RECURSE` and `"src/*.cpp"` tell CMake 
# to search for all `.cpp` files inside the "programs" directory,
# including any sub-directories that contain `.cpp` files.

# `CONFIGURE_DEPENDS` tells CMake to check the file system of the project 
# for changes before building the project. So if you add, delete, or rename,
# things inside the `src` directory,
# CMake will ensure that the variable `SRC_DIRECTORY` is updated.
file(GLOB_RECURSE SRC_DIRECTORY CONFIGURE_DEPENDS "src/*.cpp")

# This will create a binary executable called `d01-file-based-separation`,
# from all the `.cpp` files in the `src` directory
add_executable(d01-file-based-program-separation ${SRC_DIRECTORY})

# This is where you specify build settings.
# `PRIVATE cxx_std_17` tells CMake what C++ standard should 
# be used to build this specific binary.

# You can use the website below to view a list a valid C++ standards.
# I recommend using the second latest one unless you need a feature 
# from the latest one:
# https://www.cplusplus-language.org/
target_compile_features(d01-file-based-program-separation PRIVATE cxx_std_17)
