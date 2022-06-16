% example 5
% Calculating (inverse) 2D cosine transform
% compared to Matlab dct2 function
clear all; close all;

% matrixes
N = 128;
x1 = randn(N, N);
x2 = imread("cameraman.tif");

% 2D cosine transform
X1 = discreteCosineTransform2D(x1);
X2 = discreteCosineTransform2D(x2);

% Matlab function
X1_matlab = dct2(x1);
X2_matlab = dct2(x2);

% errors
error = max(max(abs(X1_matlab - X1)));
disp("X1 error = " + error);
error = max(max(abs(X2_matlab - X2)));
disp("X2 error = " + error);

% inverse cosine transform
x1_rec = inverseDiscreteCosineTransform2D(X1);
x2_rec = inverseDiscreteCosineTransform2D(X2);

% errors
error = max(max(abs(x1_rec - x1)));
disp("x1 reconstruction error = " + error);
error = max(max(abs(x2_rec - double(x2))));
disp("x2 reconstruction error = " + error);

% plot
figure;

subplot(221);
imshow(x2, []);
title("Image x2");

subplot(223);
imshow(x2_rec, []);
title("Reconstruction of image x2");

subplot(222);
imshow(X2);
title("DCT2D X2");

subplot(224);
imshow(X2_matlab);
title("DCT2D X2 matlab");