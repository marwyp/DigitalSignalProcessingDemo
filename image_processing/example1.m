% example 1
% Frequency domain image filtering
clearvars; close all;

% filter mask type:
% 1 - triangle LP
% 2 - triangle HP
type = 1;   

% image
[img, cmap] = imread("cameraman.tif");
[M, N, ~] = size(img);

% image DCT2D
IMG = dct2(img);

% mask size
K = 64;

% triangle mask - LP filter
if type == 1
    H = triangleMaskLP(M, N, K);
end

% traingle mask - HP filter
if type == 2
    H = triangleMaskLP(M, N, K);
    H = ones(M, N) - H;
end

figure;
imshow(H);
title("Mask");

% filtering
IMG_filtered = H .* IMG;

% iDCT2D
img_filtered = idct2(IMG_filtered);

% plot
figure;

subplot(221);
imshow(img, cmap);
title("Original image");

subplot(222);
imshow(IMG);
title("DCT2D of image");

subplot(223);
imshow(IMG_filtered);
title("Filtered DCT2D");

subplot(224);
imshow(img_filtered, cmap);
title("Filtered image");

