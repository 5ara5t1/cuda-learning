# 01 — Vector Add

First CUDA kernel. Based on Mark Harris's
["An Even Easier Introduction to CUDA"](https://developer.nvidia.com/blog/even-easier-introduction-cuda/),
extended with proper error checking, correctness verification, a
size-sweep benchmark, and an `ncu` profile.

## What I learned
- Kernel launch syntax and the `<<<grid, block>>>` configuration
- `threadIdx.x + blockIdx.x * blockDim.x` as the global thread index
- `cudaMalloc` / `cudaMemcpy` / `cudaFree` lifecycle
- Why grid-stride loops scale across input sizes (not in the original blog)
- A `CUDA_CHECK` macro for runtime error checking

## Build & run
make && ./vector_add

## Results
See results.md for size sweep (N = 2^10 … 2^26) and bandwidth achieved.

## Profile
ncu output committed at ncu_basic.txt — bottleneck: memory-bound.

## Credits
Original walkthrough: Mark Harris, NVIDIA Developer Blog, 2017.