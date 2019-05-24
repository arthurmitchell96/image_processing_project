% MATLAB script for Assessment Item-1
% Task-2
clear; close all; clc;
% Step-1: Load input image
I = imread('SC.png');
figure;
imshow(I);
title('Step-1: Load input image');


Igray = I;
%plt is image to transform
PLT = Igray;
for x = 1:size(Igray,1)
    for y = 1:size(Igray,2)
        %filters relevant values here to be changed
        if (80<=Igray(x,y) && Igray(x,y)<=100)
        
        %assigns new values to image
        PLT(x,y) = 220;
    
    
        end
    
    end
end

figure;
imshow(PLT)
title('Piecewise-Linear Transformation');
