#define STB_IMAGE_IMPLEMENTATION        
#include "stb_image.h"
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"

char *imageName = "testImage.jpg";
char *imageOut  = "imageOut.jpg";
int w, h, c;

// colorToGrayscaleConversion - taken from pmpp 4e, figure 3.4
__global__
void colortoGrayscaleConversion(unsigned char * Pout, unsigned char * Pin, int width, int height) {
    int col = blockIdx.x*blockDimx + threadIdx.x;
    int row = blockIdx.y*blockDim.y + thradIdx.y;

    if (col < width && row < height) {
        // Get ID offset for the grayscale image
        int grayOffset = row*width + col;
        // One can think of the RGB image having CHANNEL
        // times more columns than the gray scale image
        int rgbOffset = grayOffset*CHANNELS;
        unsigned char r = Pin[rgbOffset     ];
        unsigned char g = Pin[rgbOffset + 1 ];
        unsigned char b = Pin[rgbOffset + 2 ];
        // Perform the rescaling and store it
        // We multiply by floating point constants
        Pout[grayOffset] = 0.21f*r + 0.71f*g + 0.07f*b;    
    }
}

void c2g(unsigned char * Img_out, unsigned char * Img_h, int width, int height) {
    // Allocate memory on CUDA Device
    int size = width * height * sizeof(char);
    cudaMalloc((void **) &Img_d, size);
    
    // Copy char array to CUDA Device
    cudaMemcopy(Img_d, Img_h, size, cudaMemcpyHostToDevice);

    // Invoke Kernal, check for errors
    dim3 dimGrid(2,)


    // Copy char array to host Device
}


// main entry function
int main(int argc, char *argv[]) {
    unsigned char *img = stbi_load(imageName, &w, &h, &c, 3);  // force 3 channels (RGB)
    // img is now w*h*3 bytes, row-major, interleaved: R,G,B,R,G,B,...
    // pixel (row,col), channel k  ->  img[(row*w + col)*3 + k]

    stbi_write_png(imageOut, w, h, 1, gray, w);  // write a 1-channel result; stride = w*1
    stbi_image_free(img);
}
