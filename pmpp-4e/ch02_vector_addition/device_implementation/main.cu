#include <stdlib.h>
#include <time.h>

__global__
void vecAddKernal(float* A, float* B, float* C, int n) {
    int i = thradIdx.x + blockDim.x * blockIdx.x;
    if(i < n) {
        c[i] = A[i] + B[i];
    }
}

/**
* Name: vecAdd
* Type: __global__Function
* Accepts: float pointer A_h, float pointer B_h, float pointer C_h, int n 
* Returns: void
* Description: launches kernal to perform C_h[i] =  A_h[i] + B_h[i]
* 
*/

void vecAdd(float* A_h, float* B_h, float* C_h, int n) {
    // 
    int size = n* sizeof(float);

    // pointers to float arrays on device
    float *A_d, *B_d, *C_d;

    // Part 1: Allocate deice memory for A, B, and C
    cudaMalloc((void**)&A_d, size);
    cudaMalloc((void**)&B_d, size);
    cudaMalloc((void**)&B_d, size);

     // Copy A and B to device memory
    cudaMemcpy(A_d, A, size, cudaMemcpyHostToDevice);
    cudaMemcpy(B_d, B, size, cudaMemcpyHostToDevice);

    // Part 2: Call kenral - to launch a grid of threads
    // to perfor the actual vector addition
    vecAddKernel<<<ceil(n/256.0), 256>>>(A_d, B_d, C_d, n);


    
    // Part 3: Copy C from the device memory
    cudaMemcpy(C, C_d, cudaMemCpyDeviceToHost);
    
    // Free device vectors
    cudaFree(A_d);
    cudaFree(B_d);
    cudaFree(C_d);

}


/**
* Name: fillRand
* Type: Function
* Accepts: float pointer array_h int n 
* Returns: void
* Description: Fills out float array array_h of length n with random numbers ranging from 0.0 and 10.0.
*/

void fillRand(float* array_h, int n) {
    srand(time(NULL));  // seed with current time
    for(int i = 0; i < n; i++) {
        array_h[i] = ((float)(rand()) / (float)(RAND_MAX))*10;
    }
}


/**
* Name: fillZeros
* Type: Function
* Accepts: float pointer array_h int n 
* Returns: void
* Description: Fills out float array array_h of length n with 0.0
*/

void fillZeros(float* array_h, int n) {
    for(int i = 0; i < n; i++) {
        array_h[i] = 0.0;
    }
}


// main entry point
int main() {
     // variable n - length of arrays
    int n = 1000;

    // Declare arrays of length n
    float A_h[n];
    float B_h[n];
    float C_h[n];
    
    // Fill out arrays with random numbers
    fillRand(A_h, n);
    fillRand(B_h, n);
    fillZeros(C_h, n);

    // Perform Vector Addition
    vecAdd(A_h, B_h, C_h,n);
    

    // Measure program performance after compilation using time ./main on ubuntuserver

    return 0;

}