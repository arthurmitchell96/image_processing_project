% MATLAB script for Assessment Item-1
% Task-3
clear; close all; clc;

% Step-1: Load input image
I = imread('Noisy.png');
figure;
imshow(I);
title('Step-1: Load input image');

%zero pad array and turn into greyscale
Igray = padarray(rgb2gray(I),[2,2]);
%for mean filter to edit
Igraymean = Igray;
%for median filter to edit
Igraymedian = Igray;
%cycling through array, -2 so it does not overun array boundries
for x = 3:size(Igray,1)-2
    for y = 3:size(Igray,2)-2
    %average is created/reset here to find average value here
    ave = 0;
    %finding pixel values in the 5x5 space around the selected pixel
    for i = x-2:x+2
        for j = y-2:y+2
            %weighting each pixel and adding to find the average of
            %surrounding pixels
            ave = ave + (1/25 * Igray(i,j));

        end
     end
    
    %assigning new value
    Igraymean(x,y) = round(ave);
    
    end
end
figure;
imshow(Igraymean);
title('Mean smootihng filter');

%cycling through array, -2 so it does not overun array boundries

for xAxis = 3:size(Igray,1)-2
    for yAxis = 3:size(Igray,2)-2
    %average holder to find median value
    ave = 0;
    %counter to assign to correct part of ave array
    count = 0;
    %creating/reseting array to hold numbers
    medianArray = uint8(1:25);
    
    
        for iVal = -2:2
            for jVal = -2:2
                %finding and assigning surrounding values to find from
                %array
                count = count+1;
                medianArray(count) = Igray(xAxis+iVal,yAxis+jVal);
               
            end
        end
     %calculating median value from the surronding pixels array
     med = median(medianArray);
     %assigning median value
     Igraymedian(xAxis,yAxis)= med;
    
    end
end
figure;
imshow(Igraymedian);
title('Median smootihng filter');
