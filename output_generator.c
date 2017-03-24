//Author: Alek Patel
#include<stdio.h>
#include<stdlib.h>
#include <stdint.h>
#include <inttypes.h>
#define BMP_HEADER_SIZE 54
#define DIB_HEADER_SIZE 40
#define TRUE 1
#define FALSE 0
#pragma pack(push)
#pragma pack(1)
typedef struct _BMP_Header {
    uint16_t type;			// Magic identifier
    uint32_t size;			// File size in bytes
    uint16_t reserved1;			// Not used
    uint16_t reserved2;			// Not used
    uint32_t offset;			// Offset to image data in bytes from beginning of file (54 bytes)
    uint32_t DIB_header_size;		// DIB Header size in bytes (40 bytes)
    int32_t  width;			// Width of the image
    int32_t  height;			// Height of image
    uint16_t planes;			// Number of color planes
    uint16_t bits;			// Bits per pixel
    uint32_t compression;		// Compression type
    uint32_t imagesize;			// Image size in bytes
    int32_t  xresolution;		// Pixels per meter
    int32_t  yresolution;		// Pixels per meter
    uint32_t ncolours;			// Number of colors  
    uint32_t importantcolours;		// Important colors
} BMP_Header;

typedef struct _BMP_Image {
    BMP_Header header;
    unsigned char *data; 
} BMP_Image;


BMP_Image *
Read_BMP_Image (FILE * fptr, FILE * fptr2)
{

	// go to the beginning of the file
	fseek (fptr, 0, SEEK_SET);
	fseek (fptr2, 0, SEEK_SET);

	BMP_Image *bmp_image = NULL;

	//Allocate memory for BMP_Image*;


	//Read the first 54 bytes of the source into the header
	bmp_image = (BMP_Image *) malloc (sizeof (BMP_Image) * 1);
	//printf(" %ld\n",ftell(fptr));
	fread (&(bmp_image->header), sizeof (BMP_Header), 1, fptr);

	//printf("%" PRIu32 "\n",bmp_image->header.width);
        	//printf("%" PRIu32 "\n",bmp_image->header.height);
	//printf("%" PRIu32 "\n",bmp_image->header.size);
	//printf("%" PRIu32 "\n",bmp_image->header.imagesize);
    	//printf("%" PRIu16 "\n",b);


	if(bmp_image == NULL){free(bmp_image);
		return NULL;}


bmp_image->data = (unsigned char *) malloc (bmp_image->header.imagesize);

	fread ((bmp_image->data), (bmp_image->header.imagesize), 1, fptr2);
	

return bmp_image;
}




int
Write_BMP_Image (FILE * fptr, BMP_Image * image)
{
	// go to the beginning of the file
	fseek (fptr, 0, SEEK_SET);


	// write header
	fwrite (&(image->header), sizeof (BMP_Header), 1, fptr);
	fwrite ((image->data), (image->header.imagesize), 1, fptr);
	// write image data

	return TRUE;
}

void Free_BMP_Image (BMP_Image * image)
{

	//free(image->header);
	free(image->data);
	free(image);

}




int main(int argc, char*argv[]){
int check = 0;
//3 Arguments expected: One is header, two is data and last is output.bmp
if(argc == 4){
check = 1;
FILE *fptr; 
fptr = fopen(argv[1],"rb");
FILE *dptr = fopen(argv[2],"rb");
BMP_Image *bmp = Read_BMP_Image(fptr,dptr);

fclose(fptr);
fclose(dptr);
FILE *dptr2 = fopen(argv[3],"w");
Write_BMP_Image(dptr2, bmp);
Free_BMP_Image(bmp);
fclose(dptr2);
printf("Output file %s created\n",argv[3]);
}
else
{printf("Three inputs required: 1. header file, 2. Image_Data file, 3. Output Image file name\n");
 check = 0;
}

return 0;
}
