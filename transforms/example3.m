% example 3
% inverse transformation
% and analysis matrix orthonormality

clearvars; close all;

% signal generation
frequencies = [10, 20, 30];
fs = 1000;                  % Sampling frequency;
tLen = 1;                   % Length of signal in [s]
N = tLen * fs;              % Number of samples
t = (0 : N - 1) * 1/fs;     % Time samples
x = 0;                      % Signal
for f = frequencies
    x = x + cos(2 * pi * f * t);
end

% dft
X_dft = discreteFourierTransform(x, "dft") / N;

% idft
x_rec = inverseDiscreteFourierTransform(X_dft);
x_rec = real(x_rec);

% error
error = max(abs(x - x_rec));
disp("DFT reconstruction error = " + error);

% plot
figure;

subplot(211);
plot(t, x);
title("Original signal x");
xlabel("t [s]");

subplot(212);
plot(t, x_rec);
title("Signal DFT recontruction x_r_e_c");
xlabel("t [s]");

% dct
X_dct = discreteCosineTransform(x);

% idct
x_rec = inverseDiscreteCosineTransform(X_dct);

% error
error = max(abs(x - x_rec));
disp("DCT reconstruction error = " + error);

% plot
figure;

subplot(211);
plot(t, x);
title("Original signal x");
xlabel("t [s]");

subplot(212);
plot(t, x_rec);
title("Signal DCT recontruction x_r_e_c");
xlabel("t [s]");

% is analysis matrix of the cosine transformation ortonormal ?
k = 0 : N - 1;
n = 0 : N - 1;
A = zeros(N, N);
for i = k
    if i == 0
        s = sqrt(1/N);
    else
        s = sqrt(2/N);
    end
    w = s * cos(pi * i / N * (n + 0.5));
    A(i + 1, :) = w;
end

[ortonormal, ortogonal, M] = isOrtonormal(A);
if ortonormal
    disp("Analysys matrix of the cosine transformation is ortonormal");
else
    disp("Analysys matrix of the cosine transformation isn't ortonormal");
end