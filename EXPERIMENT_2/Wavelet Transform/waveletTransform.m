% written by Rajveer Singh (BT23ECE108)
% 2D Wavelet Transform (2-Level) WITHOUT TOOLBOX

clc;
clear;
close all;

% Read image
I = imread('ram.jpeg');

% Convert to grayscale if RGB
if size(I,3) == 3
    I = rgb2gray(I);
end

I = im2double(I);

% Display original image
figure;
imshow(I);
title('Original Image');

% Haar wavelet filters
h = [1 1]/sqrt(2);     % Low-pass
g = [1 -1]/sqrt(2);    % High-pass

%% -------- LEVEL 1 DWT --------
L1 = conv2(I, h, 'same');
H1 = conv2(I, g, 'same');

LL1 = conv2(L1, h', 'same');
LH1 = conv2(L1, g', 'same');
HL1 = conv2(H1, h', 'same');
HH1 = conv2(H1, g', 'same');

%% -------- LEVEL 2 DWT (on LL1) --------
L2 = conv2(LL1, h, 'same');
H2 = conv2(LL1, g, 'same');

LL2 = conv2(L2, h', 'same');
LH2 = conv2(L2, g', 'same');
HL2 = conv2(H2, h', 'same');
HH2 = conv2(H2, g', 'same');

%% Display Level 2 coefficients
figure;
subplot(2,2,1); imshow(LL2,[]); title('Approximation LL2');
subplot(2,2,2); imshow(LH2,[]); title('Horizontal Detail LH2');
subplot(2,2,3); imshow(HL2,[]); title('Vertical Detail HL2');
subplot(2,2,4); imshow(HH2,[]); title('Diagonal Detail HH2');
