# cuda-learning

CUDA kernel exercises and profiling experiments.

## Hardware

Compiled on RTX 2070 Super (Turing, SM_75). Default build flag: `-arch=sm_75`.

## Contents

| Chapter | Topic | Directory | Status | Date |
|---|---|---|---|---|
| — | Vector add (tutorial) | [`vector-add/`](vector-add/) | ✅ | 2026-05-16 |
| PMPP ch2 | Vector add — host (C, baseline) | [`.../host_implementation/`](pmpp-4e/ch02_vector_addition/host_implementation/) | ✅ | 2026-06-24 |
| PMPP ch2 | Vector add — device (CUDA) | [`.../device_implementation/`](pmpp-4e/ch02_vector_addition/device_implementation/) | ✅ | 2026-06-24 |
| PMPP ch3 | Colour → greyscale | [`.../color_to_grayscale_conversion/`](pmpp-4e/ch03_multidimensional_grids_and_data/color_to_grayscale_conversion/) | 🚧 [`ch3`](https://github.com/5ara5t1/cuda-learning/tree/ch3) | — |

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