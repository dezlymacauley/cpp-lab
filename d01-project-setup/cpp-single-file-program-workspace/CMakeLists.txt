cmake_minimum_required(VERSION 4.4.3)

project(cpp-single-file-workspace LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find all .cpp files recursively inside the programs directory
file(GLOB_RECURSE PROGRAM_SOURCES CONFIGURE_DEPENDS "programs/*.cpp")

foreach(SOURCE_FILE ${PROGRAM_SOURCES})
    # Extract filename without extension (e.g., f01_alpha)
    get_filename_component(TARGET_NAME ${SOURCE_FILE} NAME_WE)
    
    # Register each source file as its own standalone executable target
    add_executable(${TARGET_NAME} ${SOURCE_FILE})
endforeach()
