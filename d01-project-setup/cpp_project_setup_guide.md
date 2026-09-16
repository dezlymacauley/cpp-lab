# C++ Project Setup Guide
_______________________________________________________________________________

Create the project directory and enter it
```bash
mkdir cpp-project && cd cpp-project
```
_______________________________________________________________________________

Use `mise` to add the following tools to the project:
- `clang++`, `clangd`, 

```bash
mise use conda:clangxx@latest
mise use github:clangd/clangd@latest
mise use clang-format@latest
```

#### Note:

##### `clang++` is a compiler for C++
- the `conda:` prefix is used to download it from the Conda package repository

##### `clangd` provides language support for C and C++ project
- The `github:` prefix is used to download a pre-compiled binary from 
the official GitHub repository.

##### `clang-format` is a formatter for C++
_______________________________________________________________________________

Create a `main.cpp` file

```bash
touch main.cpp
```
_______________________________________________________________________________
