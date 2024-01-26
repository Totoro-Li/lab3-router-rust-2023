#!/bin/bash

# Stop the script on any error
set -e

# Navigate to the Rust project directory and build the Rust router
echo "Building Rust Router..."
cd router_rust
cargo build --release
cd ..

# Check if the build directory exists, if not, create it
if [ ! -d "build" ]; then
  mkdir build
fi

# Compile the test program in test_local
echo "Compiling test program..."
cd test_local
mkdir -p build
cd build
cmake ..
make
# Copy the test executable to the build directory
cp lab3_test ../../build/
cd ../..

# Compile the C++ simulator program
echo "Compiling C++ simulator program..."
cd build
# Copy the simulator static library if it's necessary for linking
cp ../router_rust/target/release/librouter_rust.a .
cp ../test_local/libsimulator.a .
# Run CMake to configure the project and then make to build
cmake ..
make

# Run local tests
echo "Running local tests..."
./lab3_test

echo "Testing complete."
