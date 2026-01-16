%Written by Rajveer Singh(BT23ECE108)
%Image read and show
%red,gray,green,black-white image show
clc;
clear all;
close all;

% Read the original RGB image
I = imread('picture.jpg');

% Display original image
figure;
imshow(I);
title('Original RGB Image');

% Convert RGB image to Grayscale
Ig = rgb2gray(I);

% Display grayscale image
figure;
imshow(Ig);
title('Grayscale Image');

% Extract Red channel (keep red, remove green & blue)
Ired = I;
Ired(:,:,2) = 0;   % Remove green channel
Ired(:,:,3) = 0;   % Remove blue channel

% Display red channel image
figure;
imshow(Ired);
title('Red Channel Image');

% Extract Green channel (keep green, remove red & blue)
Ib = I;
Ib(:,:,1) = 0;     % Remove red channel
Ib(:,:,3) = 0;     % Remove blue channel

% Display green channel image
figure;
imshow(Ib);
title('Green Channel Image');

% Convert grayscale image to binary using threshold
BW = Ig > 100;

% Display binary image
figure;
imshow(BW);
title('Binary Image (Threshold = 100)');

% Apply histogram equalization to enhance contrast
Ieq = histeq(Ig);

% Display histogram equalized image
figure;
imshow(Ieq);
title('Histogram Equalized Image');
