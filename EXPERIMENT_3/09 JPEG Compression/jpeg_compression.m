% written by Rajveer Singh (BT23ECE108)
% This code demonstrates JPEG image compression
% Part 1: Manual JPEG steps (DCT + Quantization)
% Part 2: JPEG compression using MATLAB built-in command

clc;
clear;
close all;

%% Read and preprocess image
img = imread('lena.png');
img = double(img);

if ndims(img) == 3
    img = rgb2gray(uint8(img));
    img = double(img);
end

img = img - 128;   % Level shifting
[M,N] = size(img);

%% JPEG Quantization Matrix (Standard)
Q = [16 11 10 16 24 40 51 61;
     12 12 14 19 26 58 60 55;
     14 13 16 24 40 57 69 56;
     14 17 22 29 51 87 80 62;
     18 22 37 56 68 109 103 77;
     24 35 55 64 81 104 113 92;
     49 64 78 87 103 121 120 101;
     72 92 95 98 112 100 103 99];

%% Manual JPEG Compression
compressed = zeros(M,N);

for i = 1:8:M
    for j = 1:8:N
        block = img(i:i+7, j:j+7);
        dct_block = dct2(block);
        quant_block = round(dct_block ./ Q);
        dequant_block = quant_block .* Q;
        idct_block = idct2(dequant_block);
        compressed(i:i+7, j:j+7) = idct_block;
    end
end

manual_jpeg = compressed + 128;
manual_jpeg = uint8(manual_jpeg);

%% JPEG Compression using MATLAB Command
imwrite(uint8(img+128), 'jpeg_builtin.jpg', 'jpg', 'Quality', 30);
builtin_jpeg = imread('jpeg_builtin.jpg');

%% Display Results
figure;
subplot(1,3,1);
imshow(uint8(img+128));
title('Original Image');

subplot(1,3,2);
imshow(manual_jpeg);
title('Manual JPEG Compression');

subplot(1,3,3);
imshow(builtin_jpeg);
title('JPEG using imwrite');
