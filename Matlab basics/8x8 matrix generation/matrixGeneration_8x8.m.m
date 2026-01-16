% 8x8 matrix using [0,255] random values
% Written by Rajveer Singh (BT23ECE108)
clc;
clear all;
close all;
A=zeros(8,8);
for i=1:8
        for j=1:8
           A(i,j)=randi([0 255]);
        end
end
disp('8x8 matrix using [0,255] random values: ');
disp(A);
