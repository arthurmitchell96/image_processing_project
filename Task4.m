% MATLAB script for Assessment Item-1
% Task-4
clear; close all; clc;
I = imread('Starfish.jpg');

Igrey = rgb2gray(I);

Igrey2 = medfilt2(Igrey);
%binarize image, high threshhold due to weak image
BWI = imbinarize(Igrey2,0.9);
%invert so shapes are in white
BWI = ~BWI;
%create shape for opening
bdisk = strel('disk', 1);

%opening up the objects
Ie2 = imopen(BWI, bdisk);
%2nd median filter
Ie3 = medfilt2(Ie2,[7,7]);
%3rd median filter
Ie4 = medfilt2(Ie3,[7,7]);
%removing all small images
Ie = bwpropfilt(Ie4, 'area', [900, 100000]);
%labeling image objects
labeledImage = bwlabel(Ie);
figure
title('labled image in greyscale')
imshow(labeledImage)
%getting image properties to use as filters
measurements = regionprops(labeledImage,'Area','Perimeter');
%labelling in colour to make more obvious
colourLabel = label2rgb(labeledImage);
figure
title('labled image in colour')
imshow(colourLabel)


figure
title('image after filters and removing small objects')
imshow(Ie)



%getting areas and perimeters of objects to use in metric
areas = [measurements.Area];
perimeters = [measurements.Perimeter];



varienceHolder = size(perimeters);
holder = zeros([5,1]);
metric = zeros(size(areas));
%calculates metric for all of shape
for arrayRotate = 1:size(areas,2)
metric(arrayRotate) = (4*pi*areas(arrayRotate))/perimeters(arrayRotate)^2;
end
%originally this nex bit was to automatically find the values for the upper
%and lower bounds to extract from but it didn't quite work
%sortedMetric = sort(metric);
%for x= 1:size(metric,2)-5
 %  holder = zeros([5,1]);
  % count = 1;
   % for i = x:x+5 
    %holder(count,1) = sortedMetric(i);
    
    %count = count +1;
    %disp(count)
    %disp(holder)
    %end
   %varienceHolder(x) = var(holder);
   
%end
%p = min(varienceHolder);
%filters between section of the metric to extract correct objects, I looked at how the objects clusterd and this is the range the starfish was in
filta = find(metric <0.35 & metric>0.29);
%adds members of filta and labled image together in an and merge operation 
finalImg = ismember(labeledImage, filta);
figure
title('final image after extraction')
imshow(finalImg)
