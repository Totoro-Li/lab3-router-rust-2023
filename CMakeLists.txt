cmake_policy(SET CMP0048 NEW)
cmake_minimum_required(VERSION 3.11)
project(lab3)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2")


# Include the Rust static library
add_library(router_wrapper STATIC src/wrapper.cpp)
find_library(LIB_ROUTER_WRAPPER router_rust build/)
target_link_libraries(router_wrapper ${LIB_ROUTER_WRAPPER})
        
# Simulator source files
set(SIMULATOR_SRC src/simulator.cpp)  # Add other C++ source files if necessary

add_executable(simulator ${SIMULATOR_SRC})

find_library(LIB_SIMULATOR simulator build/)
message(STATUS "LIB_SIMULATOR: ${LIB_SIMULATOR}")

target_link_libraries(simulator ${LIB_SIMULATOR} )

target_link_libraries(simulator router_wrapper)
