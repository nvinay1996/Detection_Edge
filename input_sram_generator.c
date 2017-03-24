//Author: Vinay Nagarajan
#include<stdio.h>
#include<stdlib.h>
#include <stdint.h>
#include <inttypes.h>
#include<string.h>
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
Read_BMP_Image (FILE * fptr)
{

	// go to the beginning of the file
	fseek (fptr, 0, SEEK_SET);
	BMP_Image *bmp_image = NULL;

	//Allocate memory for BMP_Image*;


	//Read the first 54 bytes of the source into the header
	bmp_image = (BMP_Image *) malloc (sizeof (BMP_Image) * 1);
	//printf(" %ld\n",ftell(fptr));
	fread (&(bmp_image->header), sizeof (BMP_Header), 1, fptr);

	printf("%" PRIu32 "\n",bmp_image->header.width);
        	printf("%" PRIu32 "\n",bmp_image->header.height);
	printf("%" PRIu32 "\n",bmp_image->header.size);
	printf("%" PRIu32 "\n",bmp_image->header.imagesize);
    	//printf("%" PRIu16 "\n",b);


	if(bmp_image == NULL){free(bmp_image);
		return NULL;}


bmp_image->data = (unsigned char *) malloc (bmp_image->header.imagesize);

	fread ((bmp_image->data), (bmp_image->header.imagesize), 1, fptr);
	

return bmp_image;
}




int
Write_BMP_Image (FILE * fptr, FILE * fptr2, BMP_Image * image)
{
	// go to the beginning of the file
	fseek (fptr, 0, SEEK_SET);
	fseek (fptr2, 0, SEEK_SET);

	// write header
	fwrite (&(image->header), sizeof (BMP_Header), 1, fptr);
	fwrite ((image->data), (image->header.imagesize), 1, fptr2);
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
//One argument expected which is image.bmp
FILE *fptr; 
fptr = fopen(argv[1],"r");
BMP_Image *bmp = Read_BMP_Image(fptr);

fclose(fptr);
int size2 = strlen(argv[1]) - 4 + 3;
int l = 0;
char *d = malloc(sizeof(char)*size2);
for(l = 0;l<strlen(argv[1])-4;l++){
d[l] = argv[1][l];
}
d[l] = '\0';
strcat(d,".b");

char c[30] = "header_";
strcat(c,d);
FILE *dptr = fopen(c,"wb");
printf("%s\n",c);
char a[30] = "input_";
strcat(a,d);

FILE *dptr2 = fopen(a,"wb");
printf("%s\n",a);
Write_BMP_Image(dptr, dptr2, bmp);
Free_BMP_Image(bmp);
fclose(dptr);
fclose(dptr2);
free(d);



return 0;
}
