% MATLAB script for Assessment Item-1
% Task-1
clear; close all; clc;

% Step-1: Load input image
I = imread('Zebra.jpg');
figure;
imshow(I);
title('Step-1: Load input image');

% Step-2: Conversion of input image to grey-scale image
Igray = rgb2gray(I);
figure;
imshow(Igray);
title('Step-2: Conversion of input image to greyscale');

% nearset neighbor output
NNI = uint8(zeros(1668,1836));



%get rid of uint8 errors
Igray2 = im2uint8(Igray);
%show inital image
figure;
imshow(Igray);
%cycle through x axis of array to be tranfred to
for j=1:size(NNI,1)-3
    
    %cycle through x axis of array to be tranfred to
    for i=1:size(NNI,2)-3
        
        %fromulea to work out which pixel goes where         
        x = (round( (j-1)*(556-1)/(1668-1))+1);
        y = (round( (i-1)*(612-1)/(1836-1))+1);
              
         %assigning pixel to new array          
        NNI(j,i) = Igray2(x,y);
              
             
    end
     
end
figure;
imshow(NNI);
title('Nearest Neighbor');
%creating template for new array
BI =  uint8(zeros(1668,1836));
xb=0;
yb=0;
for a=1:size(BI,1)-3
    for b=1:size(BI,2)-3
        %if inout is less than 3 make equal to 1 as matlab starts counting
        %from 1
        if a < 3 || b<3
           xb =1;
           yb =1;
        else
            xb = a/3;
            yb = b/3;
        end
        
        
        

        %change in x and y from wanted pixel to floor pixel calculated
        deltX = xb - floor(xb);
        deltY = yb - floor(yb);


        %p is result of the formulea finding the wighted pixel value
        p = Igray2(floor(xb),floor(yb)) *(1-deltX)*(1-deltY)+ Igray2(floor(xb)+1,floor(yb)) *deltX*(1-deltY)+Igray2(floor(xb),floor(yb)+1) *(1-deltX)*deltY+Igray2(floor(xb)+1,floor(yb)+1) *deltX*deltY;
        %assining value to place on the array
        BI(a,b) = p;
        
    end
end

figure;
imshow(BI);
title('Bileniar');



