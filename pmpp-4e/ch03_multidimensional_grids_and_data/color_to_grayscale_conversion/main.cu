#define STB_IMAGE_IMPLEMENTATION        
#include "stb_image.h"
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include "stb_image_write.h"

char *imageName = "testImage.jpg";
char *imageOut  = "imageOut.jpg";
int w, h, c;




// main entry function
int main(int argc, char *argv[]) {
    unsigned char *img = stbi_load(imageName, &w, &h, &c, 3);  // force 3 channels (RGB)
    // img is now w*h*3 bytes, row-major, interleaved: R,G,B,R,G,B,...
    // pixel (row,col), channel k  ->  img[(row*w + col)*3 + k]

    stbi_write_png(imageOut, w, h, 1, gray, w);  // write a 1-channel result; stride = w*1
    stbi_image_free(img);
}
