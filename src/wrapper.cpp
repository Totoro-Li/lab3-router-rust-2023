// src/Wrapper.cpp
#include "wrapper.h"
#include "rust_functions.h" // This header will declare the Rust functions

void *create_router_object()
{
    return rust_create_router_object();
}

void destroy_router_object(void *ptr)
{
    rust_destroy_router_object(ptr);
}
