# C++ Project Setup Guide
_______________________________________________________________________________

Create the project directory and enter it
```bash
mkdir cpp-project && cd cpp-project
```
_______________________________________________________________________________

Use `mise` to add the following tools to the project:
- `cmake`, `cmake-language-server`,
- `ninja`
- `clang++`, `clangd`, `clang-format`

```bash
mise use cmake@latest
mise use "pipx:cmake-language-server[uvx_args=--with pygls<2]@latest"

mise use ninja@latest

mise use conda:clangxx@latest
mise use github:clangd/clangd@latest
mise use clang-format@latest
```
_______________________________________________________________________________

#### Note:

##### `cmake`
- This is used to read `CMakeList.txt` files, 
generate build instructions for a specific build generator,
and then trigger that build generator to use a C++ compiler 
to build the project.

##### `cmake-language-server`
- This provides language support for `CMakeLists.txt` files

##### `ninja`
- This the build generator that will use a C++ compiler to build the project. 
- It is available on the mise registry, so no prefix is required

##### `clang++` 
- This is a compiler for C++
- the `conda:` prefix is used to download it from 
the Conda package repository

##### `clangd` 
- This provides language support for C and C++ files, including header files
- The `github:` prefix is used to download a pre-compiled binary from 
the official GitHub repository.

##### `clang-format` 
- This is a formatter for C++ and C files.
- It is available on the mise registry, so no prefix is required
_______________________________________________________________________________

Create the project structure

```bash
touch .gitignore CMakeLists.txt main.cpp 
```
_______________________________________________________________________________

Add this to the `.gitignore` file
```bash
# Build Output
/build/
```
_______________________________________________________________________________

Add this to the `main.cpp` file
```cpp
#include <iostream>

int main() {
    std::cout << "\nC++ Project\n";

    return 0;
}
```
_______________________________________________________________________________
