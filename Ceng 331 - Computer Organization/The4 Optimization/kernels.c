/********************************************************
 * Kernels to be optimized for the CS:APP Performance Lab
 ********************************************************/

#include <stdio.h>
#include <stdlib.h>
#include "defs.h"
/* 
 * Please fill in the following student struct 
 */
team_t team = {
    "2099356",              /* Student ID */

    "Muhammed Yusuf Temizer",     /* full name */
    "e290935@metu.edu.tr",  /* email address */

    "",                   /* leave blank */
    ""                    /* leave blank */
};


/***************
 * CONVOLUTION KERNEL
 ***************/

/******************************************************
 * Your different versions of the convolution functions  go here
 ******************************************************/

/* 
 * naive_conv - The naive baseline version of convolution 
 */
char naive_conv_descr[] = "naive_conv: Naive baseline implementation";
void naive_conv(int dim,int *src, int *ker,int *dst) {
    int i,j,k,l;

    for(i = 0; i < dim-8+1; i++)
        for(j = 0; j < dim-8+1; j++) {
            dst[j*dim+i] = 0;
            for(k = 0; k < 8; k++)
                for(l = 0; l < 8; l++) {
                    dst[j*dim+i] = dst[j*dim+i] +src[(j+l)*dim+(i+k)]*ker[l*dim+k];
                }
        }
            
        
}

/* 
 * convolution - Your current woion of convolution
 * IMPORTANT: This is the version you will be graded on
  */  


char convolution_descr[] = "Dot product: Current working version";
void convolution(int dim,int *src, int *ker,int *dst) 
{
int i,j,c;

    for(i = 0; i < dim-8+1; i++){
        for(j = 0; j < dim-8+1; j++) {
    	    c = 0;
			c = c +src[(j+0)*dim+(i+0)]*ker[0*dim+0];
            c = c +src[(j+0)*dim+(i+1)]*ker[0*dim+1];
            c = c +src[(j+0)*dim+(i+2)]*ker[0*dim+2];
			c = c +src[(j+0)*dim+(i+3)]*ker[0*dim+3];
            c = c +src[(j+0)*dim+(i+4)]*ker[0*dim+4];
			c = c +src[(j+0)*dim+(i+5)]*ker[0*dim+5];
			c = c +src[(j+0)*dim+(i+6)]*ker[0*dim+6];
			c = c +src[(j+0)*dim+(i+7)]*ker[0*dim+7];

            c = c +src[(j+1)*dim+(i+0)]*ker[1*dim+0];
			c = c +src[(j+1)*dim+(i+1)]*ker[1*dim+1];
	        c = c +src[(j+1)*dim+(i+2)]*ker[1*dim+2];
			c = c +src[(j+1)*dim+(i+3)]*ker[1*dim+3];
			c = c +src[(j+1)*dim+(i+4)]*ker[1*dim+4];
			c = c +src[(j+1)*dim+(i+5)]*ker[1*dim+5];
			c = c +src[(j+1)*dim+(i+6)]*ker[1*dim+6];
			c = c +src[(j+1)*dim+(i+7)]*ker[1*dim+7];

			c = c +src[(j+2)*dim+(i+0)]*ker[2*dim+0];
	        c = c +src[(j+2)*dim+(i+1)]*ker[2*dim+1];
			c = c +src[(j+2)*dim+(i+2)]*ker[2*dim+2];
			c = c +src[(j+2)*dim+(i+3)]*ker[2*dim+3];
			c = c +src[(j+2)*dim+(i+4)]*ker[2*dim+4];
			c = c +src[(j+2)*dim+(i+5)]*ker[2*dim+5];
			c = c +src[(j+2)*dim+(i+6)]*ker[2*dim+6];
			c = c +src[(j+2)*dim+(i+7)]*ker[2*dim+7];


            c = c +src[(j+3)*dim+(i+0)]*ker[3*dim+0];
	        c = c +src[(j+3)*dim+(i+1)]*ker[3*dim+1];
			c = c +src[(j+3)*dim+(i+2)]*ker[3*dim+2];
			c = c +src[(j+3)*dim+(i+3)]*ker[3*dim+3];
			c = c +src[(j+3)*dim+(i+4)]*ker[3*dim+4];
			c = c +src[(j+3)*dim+(i+5)]*ker[3*dim+5];
			c = c +src[(j+3)*dim+(i+6)]*ker[3*dim+6];
			c = c +src[(j+3)*dim+(i+7)]*ker[3*dim+7];

            c = c +src[(j+4)*dim+(i+0)]*ker[4*dim+0];
			c = c +src[(j+4)*dim+(i+1)]*ker[4*dim+1];
	        c = c +src[(j+4)*dim+(i+2)]*ker[4*dim+2];
	        c = c +src[(j+4)*dim+(i+3)]*ker[4*dim+3];
			c = c +src[(j+4)*dim+(i+4)]*ker[4*dim+4];
			c = c +src[(j+4)*dim+(i+5)]*ker[4*dim+5];
			c = c +src[(j+4)*dim+(i+6)]*ker[4*dim+6];
			c = c +src[(j+4)*dim+(i+7)]*ker[4*dim+7];

            c = c +src[(j+5)*dim+(i+0)]*ker[5*dim+0];
	        c = c +src[(j+5)*dim+(i+1)]*ker[5*dim+1];
			c = c +src[(j+5)*dim+(i+2)]*ker[5*dim+2];
			c = c +src[(j+5)*dim+(i+3)]*ker[5*dim+3];
			c = c +src[(j+5)*dim+(i+4)]*ker[5*dim+4];
			c = c +src[(j+5)*dim+(i+5)]*ker[5*dim+5];
			c = c +src[(j+5)*dim+(i+6)]*ker[5*dim+6];
			c = c +src[(j+5)*dim+(i+7)]*ker[5*dim+7];


            c = c +src[(j+6)*dim+(i+0)]*ker[6*dim+0];
			c = c +src[(j+6)*dim+(i+1)]*ker[6*dim+1];
			c = c +src[(j+6)*dim+(i+2)]*ker[6*dim+2];
	        c = c +src[(j+6)*dim+(i+3)]*ker[6*dim+3];
			c = c +src[(j+6)*dim+(i+4)]*ker[6*dim+4];
			c = c +src[(j+6)*dim+(i+5)]*ker[6*dim+5];
			c = c +src[(j+6)*dim+(i+6)]*ker[6*dim+6];
			c = c +src[(j+6)*dim+(i+7)]*ker[6*dim+7];

            c = c +src[(j+7)*dim+(i+0)]*ker[7*dim+0];
	        c = c +src[(j+7)*dim+(i+1)]*ker[7*dim+1];
			c = c +src[(j+7)*dim+(i+2)]*ker[7*dim+2];
			c = c +src[(j+7)*dim+(i+3)]*ker[7*dim+3];
			c = c +src[(j+7)*dim+(i+4)]*ker[7*dim+4];
			c = c +src[(j+7)*dim+(i+5)]*ker[7*dim+5];			
			c = c +src[(j+7)*dim+(i+6)]*ker[7*dim+6];
			c = c +src[(j+7)*dim+(i+7)]*ker[7*dim+7];	

		dst[j*dim +i ] = c;
	}
    }

}

/*********************************************************************
 * register_conv_functions - Register all of your different versions
 *     of the convolution functions  with the driver by calling the
 *     add_conv_function() for each test function. When you run the
 *     driver program, it will test and report the performance of each
 *     registered test function.  
 *********************************************************************/

void register_conv_functions() {
    add_conv_function(&naive_conv, naive_conv_descr);   
    add_conv_function(&convolution, convolution_descr);   
    /* ... Register additional test functions here */
}


/***************
 * MATRIX MULTIP KERNEL
 ***************/

/******************************************************
 * Your different versions of the matrix multiplications  go here
 ******************************************************/

/* 
 * naive_matrix_multiplication - The naive baseline version of matrix multiplication 
 */
char naive_matrix_multiplication_descr[] = "Naive_matrix_multiplication: Naive baseline implementation";
void naive_matrix_multiplication(int dim,int *src, int *src2,int *dst) {
    int i,j,k;

    for(i = 0; i < dim; i++)
        for(j = 0; j < dim; j++) {
            dst[j*dim+i]=0;
            for(k = 0; k < dim; k++) 
                dst[j*dim+i] = dst[j*dim+i] + src[j*dim+k]*src2[i+k*dim];
        }    
}


/* 
 * matrix_multiplication - Your current working version of matrix_multiplication
 * IMPORTANT: This is the version you will be graded on
 */
char matrix_multiplication_descr[] = "Matrix multiplications: Current working version";
void matrix_multiplication(int dim,int *src, int *src2,int *dst) 
{
    int i,j,k,ali,c,tmp;
    for(i = 0; i<dim; i++){
	ali = 0;
	for(j = 0; j<dim; j++){
	    c = 0;
	    tmp = ali +i;
	    for(k = 0; k<dim; k = k+32){
                c+= src[ali +k] * src2[i + k*dim] + 
                src[ali +k+1]*src2[i + (k+1)*dim] + 
                src[ali +k+2]*src2[i + (k+2)*dim] + 
                src[ali +k+3]*src2[i + (k+3)*dim] + 
                src[ali +k+4]*src2[i + (k+4)*dim] + 
                src[ali +k+5]*src2[i + (k+5)*dim] + 
                src[ali +k+6]*src2[i + (k+6)*dim] + 
                src[ali +k+7]*src2[i + (k+7)*dim] +    
                src[ali +k+8]*src2[i + (k+8)*dim] + 
                src[ali +k+9]*src2[i + (k+9)*dim] + 
                src[ali +k+10]*src2[i + (k+10)*dim] + 
                src[ali +k+11]*src2[i + (k+11)*dim] + 
                src[ali +k+12]*src2[i + (k+12)*dim] + 
                src[ali +k+13]*src2[i + (k+13)*dim] + 
                src[ali +k+14]*src2[i + (k+14)*dim] + 
                src[ali +k+15]*src2[i + (k+15)*dim] +   
                src[ali +k+16]*src2[i + (k+16)*dim] + 
                src[ali +k+17]*src2[i + (k+17)*dim] + 
                src[ali +k+18]*src2[i + (k+18)*dim] + 
                src[ali +k+19]*src2[i + (k+19)*dim] + 
                src[ali +k+20]*src2[i + (k+20)*dim] + 
                src[ali +k+21]*src2[i + (k+21)*dim] + 
                src[ali +k+22]*src2[i + (k+22)*dim] + 
                src[ali +k+23]*src2[i + (k+23)*dim] +   
                src[ali +k+24]*src2[i + (k+24)*dim] + 
                src[ali +k+25]*src2[i + (k+25)*dim] + 
                src[ali +k+26]*src2[i + (k+26)*dim] + 
                src[ali +k+27]*src2[i + (k+27)*dim] + 
                src[ali +k+28]*src2[i + (k+28)*dim] + 
                src[ali +k+29]*src2[i + (k+29)*dim] + 
                src[ali +k+30]*src2[i + (k+30)*dim] + 
                src[ali +k+31]*src2[i + (k+31)*dim];
            }
	    dst[tmp] = c;
	    ali += dim;
	}
    }
       // naive_matrix_multiplication(dim,src,src2,dst);

}

/*********************************************************************
 * register_matrix_multiplication_functions - Register all of your different versions
 *     of the matrix multiplication  with the driver by calling the
 *     add_matrix_multiplication_function() for each test function. When you run the
 *     driver program, it will test and report the performance of each
 *     registered test function.  
 *********************************************************************/

void register_matrix_multiplication_functions() {
    add_matrix_multiplication_function(&naive_matrix_multiplication, naive_matrix_multiplication_descr);   
    add_matrix_multiplication_function(&matrix_multiplication, matrix_multiplication_descr);   
    /* ... Register additional test functions here */
}

