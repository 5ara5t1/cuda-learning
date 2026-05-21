# vector-add

Element-wise vector add (`y[i] = x[i] + y[i]`) for N = 2^20 fp32 elements.

Uses CUDA Unified Memory (`cudaMallocManaged`) with explicit prefetch to the
device (`cudaMemPrefetchAsync`) before kernel launch. The kernel uses a
grid-stride loop.

Based on Mark Harris's
[*An Even Easier Introduction to CUDA*](https://developer.nvidia.com/blog/even-easier-introduction-cuda/),
extended with grid-stride scheduling and Unified Memory prefetching.

The nsys_easy script is provided by Mark Harris, originally from [*here*](https://github.com/harrism/nsys_easy).

## Build

    nvcc -arch=sm_75 -O3 vector-add.cu -o vector-add

## Run

    ./vector-add

Or via the profiling wrapper:

    nsys_easy ./vector-add

## Files

- `vector-add.cu` — kernel source and host driver
- `nsys_easy` — Nsight Systems profiling wrapper (gpu-mode utility; third-party)

## Hardware

Compiled and tested on RTX 2070 Super (Turing, sm_75).
