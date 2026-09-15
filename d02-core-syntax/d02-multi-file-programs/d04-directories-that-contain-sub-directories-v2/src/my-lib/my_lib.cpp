// This line is there to establish that this `my_lib.cpp` file,
// and `my_lib.hpp` are connected.

// Think of `my_lib.hpp` as a summary of the tools that are available in 
// `my_lib.cpp`

// `my_lib.cpp` contains the implementation details of how those tools work.
#include "my_lib.hpp"

#include <iostream>

void print_hello_world() {
    std::cout << "\nHello World\n\n";
}
