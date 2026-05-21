# cuda-learning

CUDA kernel exercises and profiling experiments.

## Hardware

Compiled on RTX 2070 Super (Turing, SM_75). Default build flag: `-arch=sm_75`.

## Contents

| Directory | Topic | Date |
|---|---|---|
| [vector-add](vector-add/) | Element-wise vector add with CUDA Unified Memory and prefetch. | 2026-05-16 |

Planned: matrix transpose (naive / coalesced / tiled), reductions, naive matmul.

## Build

Each subdirectory contains a `Makefile` (or build instructions in its README). General form:

    nvcc -arch=sm_75 -O3 kernel.cu -o kernel

## References

- Hwu, Kirk, Hajj — *Programming Massively Parallel Processors*
- Bryant, O'Hallaron — *Computer Systems: A Programmer's Perspective*, Ch 3, 5, 6
- NVIDIA CUDA C++ Programming Guide
- Mark Harris, NVIDIA Developer Blog

## License

MIT