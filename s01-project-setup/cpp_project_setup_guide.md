# C++ Project Setup Guide
_______________________________________________________________________________

Create the project directory and enter it
```bash
mkdir cpp-project && cd cpp-project 
```
_______________________________________________________________________________

Use `mise` to the set the project to use the latest version 
of `clang`, `cmake`, and `ninja`
```bash
mise use clang@latest
mise use cmake@latest
mise use ninja@latest
```

Note:
- `clang` a collection of tools for C and C++ project. 
It includes the `clang++` toolchaing that includes `clang++` C++ compiler

- `cmake` generates build instructions using a `CMakeLists.txt` file
- `ninja` executes the build instructions that CMake generated 
_______________________________________________________________________________

Create the project structure
```bash
touch .gitignore
touch CMakeLists.txt
mkdir src && touch src/main.cpp
```
_______________________________________________________________________________

Add this to the `.gitignore` file
```bash
# Build Output
/build/
```
_______________________________________________________________________________
