#include <iostream>
#include <math.h>
#include <chrono>




// // function to add the elements of two arrays
// void add(int n, float *x, float *y) {
//     for(int i = 0; i < n; i++) {
//         y[i] = x[i] + y[i];
//     }
// }

// Kernel function to add the elements for two arrays
__global__
void add(int n, float *sum, float *x, float *y) {
    for(int i = 0; i < n; i++) {
        sum[i] = x[i] + y[i];
    }
}

int main(void) {
    int N = 1<<20; // 1M elements
    float *x, *y, *sum; // variable pointers

    // Allocate Unified Memory - accessible from CPU or GPU
    cudaMallocManaged(&x, N*sizeof(float));
    cudaMallocManaged(&y, N*sizeof(float));

    // initialize x an y arrays on the host
    for(int i = 0; i < N; i++) {
        x[i] = 1.0f;
        y[i] = 2.0f;
    }

    // capture start time (CPU FOR)
    auto start = std::chrono::steady_clock::now();

    // Run kernel on 1M elements on the GPU
    add<<<1, 1>>>(N, sum, x, y);

    // Wait for GPU to finish before accessing on host
    cudaDeviceSynchronize();

    // 2. Capture end time (CPU FOR)
    auto end = std::chrono::steady_clock::now();

    // Check for errors (all values should be 3.0f)
    float maxError = 0.0f;
    for (int i = 0; i < N; i++) {
        maxError = fmax(maxError, fabs(y[i]-3.0f));
    }
    std::cout << "Max error: " << maxError << std::endl;

    // Calculate time diference in nanoseconds, print to user
    auto elapsed = std::chrono::duration_cast<std::chrono::nanoseconds>(end - start);
    std::cout << "Time: " << elapsed.count() << " ns" << std::endl;
    
    // free memeory
    cudaFree(x);
    cudaFree(y);
    return 0;

}