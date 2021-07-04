# Interpolation to increase the number of pixels in an image
(done as course project for Computational physics.)
## Overview
According to the problem statement, the number of pixels in a given image was increased by interpolating between adjacent rows and columns to add new rows and columns in between. This essentially scaled the image to have twice the number of rows and columns as in the original image. The MATLAB program written for the given problem statement accepts either a grayscale image or an RGB image. It displays the scaled images along with the original image in MATLAB’s image viewer application.

## Explanation of the functions
MATLAB functions were written to perform the interpolation. In order to maintain the aspect ratio of the image, it was necessary to add an extra row and column to the scaled image. Two methods were used to achieve this, as explained below:
### 1. interpolate()
   A temporary matrix with twice the number of rows and columns as the original image matrix was created using the zeros() function. It was then populated first with the rows, alternating between original matrix values and interpolated values. 
  In the end, the last row was added by duplicating the values of the second last row.
  This temporary matrix was then used to generate the final matrix for the scaled image, by interpolating about the columns in a similar fashion, and adding the last column by duplicating the values if the second last column.

### 2. correctedInterpolate()
  The only difference between this function and interpolate() is the method in which the last row and column are added. Instead of duplicating the last row, two rows are inserted between the second last and last row using interpolation. This preserves the aspect ratio of the image while preventing duplicate pixel values.
  The same procedure is repeated for the columns.

## Results and comparisons
The following shows the results of applying the code to a grayscale image (with comparisons with built-in methods)
Note: interpolate() and correctedInterpolate() produce almost identical results; therefore only results from interpolate() are shown


   1. Original image  
   ![alt text](https://github.com/Utkarsh0902/image-interpolation/tree/main/readme-images/1_original.png)


   A. Zoomed-in original image
   B. Zoomed-in original image with bilinear interpolation from MATLAB
   C. Zoomed-in original image with nearest-neighbor interpolation from MATLAB
   D. Scaled image using interpolate() function  
   ![alt text](https://github.com/Utkarsh0902/image-interpolation/tree/main/readme-images/1_inter.png)
        

The following shows the results of applying the code to a color image (with comparisons with built-in methods)  



  1. Original image  
  ![alt text](https://github.com/Utkarsh0902/image-interpolation/tree/main/readme-images/2_original.png)


  A. Zoomed-in original image
  B. Zoomed-in original image with bilinear interpolation from MATLAB
  C. Zoomed-in original image with nearest-neighbor interpolation from MATLAB
  D. Scaled image using interpolate() function  
  ![alt text](https://github.com/Utkarsh0902/image-interpolation/tree/main/readme-images/2_inter.png)
