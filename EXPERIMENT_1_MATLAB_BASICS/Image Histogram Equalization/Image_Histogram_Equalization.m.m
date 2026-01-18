%Written by Rajveer Singh(BT23ECE108)
%Image Histogram Equalization
clc;
clear;
close all;

% Read image
img = imread('picture.jpg');   % use a grayscale image
if size(img,3) == 3
    img = rgb2gray(img);
end

img = double(img);           % convert to double
[M, N] = size(img);
L = 256;                     % number of gray levels

% Step 1: Histogram
hist = zeros(1, L);
for i = 1:M
    for j = 1:N
        gray = img(i,j) + 1; % +1 for MATLAB indexing
        hist(gray) = hist(gray) + 1;
    end
end

% Step 2: PDF
pdf = hist / (M * N);

% Step 3: CDF
cdf = zeros(1, L);
cdf(1) = pdf(1);
for k = 2:L
    cdf(k) = cdf(k-1) + pdf(k);
end

% Step 4: Find first non-zero CDF (CDF_min)
cdf_min = min(cdf(cdf > 0));

% Step 5: Transformation function
T = zeros(1, L);
for k = 1:L
    T(k) = round(((cdf(k) - cdf_min) / (1 - cdf_min)) * (L - 1));
end

% Step 6: Map pixels
eq_img = zeros(M, N);
for i = 1:M
    for j = 1:N
        eq_img(i,j) = T(img(i,j) + 1);
    end
end

eq_img = uint8(eq_img);

% Display results
figure;
subplot(1,2,1);
imshow(uint8(img));
title('Original Image');

subplot(1,2,2);
imshow(eq_img);
title('Histogram Equalized Image');
