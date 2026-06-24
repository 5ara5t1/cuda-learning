#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/**
* Name: vecAdd
* Type: Function
* Accepts: float pointer A_h, float pointer B_h, float pointer C_h, int n 
* Returns: void
* Description: sequentially performs C_h[i] =  A_h[i] + B_h[i]
* for i < n, with n = array length
*/

void vecAdd(float* A_h, float* B_h, float* C_h, int n) {
    for(int i = 0; i<n; i++) {
        C_h[i] = A_h[i] + B_h[i];
    }
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
int main(int argc, char *argv[]) {
    // require array length n as the first command-line argument
    if (argc < 2) {
        fprintf(stderr, "usage: %s <n>\n", argv[0]);
        return 1;
    }

     // variable n - length of arrays
    int n = atoi(argv[1]);

    // Allocate arrays of length n on the heap (stack VLAs overflow for large n)
    float *A_h = (float*)malloc(n * sizeof(float));
    float *B_h = (float*)malloc(n * sizeof(float));
    float *C_h = (float*)malloc(n * sizeof(float));
    if (!A_h || !B_h || !C_h) {
        fprintf(stderr, "allocation failed for n=%d\n", n);
        return 1;
    }

    // Fill out arrays with random numbers
    fillRand(A_h, n);
    fillRand(B_h, n);
    fillZeros(C_h, n);

    // Perform Vector Addition
    vecAdd(A_h, B_h, C_h,n);

    // Free host arrays
    free(A_h);
    free(B_h);
    free(C_h);

    // Measure program performance after compilation using time ./main on ubuntuserver

    return 0;

}