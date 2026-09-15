add_subdirectory(my-lib)

add_executable($ENV{PROJECT_NAME} main.cpp)

target_link_libraries($ENV{PROJECT_NAME} PRIVATE my_lib)
