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
int main() {
    // create struct for measuring elapsed program time
    struct timespec start, end;
    
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