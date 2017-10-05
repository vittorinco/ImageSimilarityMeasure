% Vittorio Longi - CS 559 - 9/12/2017
% This program checks the similarity of two RGB
% images of same resolution and depth.
clear
clc

A = imread('Pebbles.jpg');
B = 255 - A(:,:,:); % negative of A
C = imread('Sample.jpg');
w_image = imread('white.jpg');
b_image = imread('black.jpg');

maxError = size(A,1)^3; % when one image is white and one is black
error = [0,0,0];

tmpsize = size(A);
imgsize = tmpsize(1);
imgdepth = tmpsize(3);

for i = 1:imgdepth % for color band
    for j = 1:imgsize-1 % for width
        for k = 1:imgsize-1 % for height
            pxlError = abs( ...
                double( b_image(j,k,i)) - double( b_image(j,k,i)) );
            error(i) = error(i) + pxlError;
        end
    end
end
    
R_similarity = 100 - error(1)*100/maxError
G_similarity = 100 - error(2)*100/maxError
B_similarity = 100 - error(3)*100/maxError

Avg_similarity = (R_similarity + G_similarity + B_similarity) / 3