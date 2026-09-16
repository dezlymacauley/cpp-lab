# How to run this program
_______________________________________________________________________________

## High Level Explanation
_______________________________________________________________________________

### 1. `CMake` and `CMakeLists.txt`

Think of your program as a meal.

`CMake` is the head chef with a recipe called `CMakeLists.txt`.

Just like how the head chef is not responsible for cooking,
`CMake` is does not perform the actual building of the program.

So `CMakeLists.txt` is the build instructions for the program.
_______________________________________________________________________________

### 2. `Ninja` and `clang++`

Think of `Ninja` as the cook, and `clang++` as the tool that will be used by
cook to cook each ingredient.

`clang++` is the is the C++ compiler. This is used to convert `.cpp` files
into a binary executable (aka machine code).

The issue is that `CMakeLists.txt` is written in a format that is only
convinient for `CMake` the head chef to use. So the first thing that CMake
needs to do is to convert the build instructions in a format that `Ninja`
can use.

_______________________________________________________________________________

## Step 1: Generate the build instructions 

```bash
cmake -G Ninja -DCMAKE_CXX_COMPILER=clang++ -B build
```

Note: 
`-G Ninja` tells CMake to convert the build instructions 
in the CMakeLists.txt file into build instructions that `Ninja` can use.

- `DCMAKE_CXX_COMPILER=clang++` is used to declare `clang++` in the build
instructions, as the tool that should be used to build the program.

- `-B build` is used to declare where the build instructions 
should be saved. In this example, they will be saved in the `build` directory.

- If the `build` directory does not exist, it will be created.
_______________________________________________________________________________

## Step 2: Build the program

Since the build instructions in the `build` directory were generated 
for `Ninja`, `Ninja` will execute those build instructions using `clang` 
```bash
cmake --build build
```
_______________________________________________________________________________

## Step 3: Run the program
```bash
./build/cmake-explained
```
_______________________________________________________________________________
