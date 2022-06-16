% example 4
% Calculating dft of 2 N-point real signals
% using 1 N-point dft
clear all; close all;

% signals generation
N = 1024;                   % Number of samples
fs = 1000;                  % Sampling frequency;
t = (0 : N - 1) * 1/fs;     % Time samples

% signal 1
frequencies = [10, 20, 60, 300, 400];                 
x1 = 0;                      % Signal
for f = frequencies
    x1 = x1 + cos(2 * pi * f * t);
end

% signal 2
frequencies = [30, 50, 100, 200, 450];                 
x2 = 0;                      % Signal
for f = frequencies
    x2 = x2 + cos(2 * pi * f * t);
end

f = (0 : N - 1) * fs / N;   % frequencies in dft
f = f - fs / 2;

% signal y
y = x1 + 1i * x2;

% spectrum y: Y = (X1r - X2i) + j(X1i + X2r) = Yr + Yi
Y = discreteFourierTransform(y, "fft");     
Yr = real(Y);   % real part of Y
Yi = imag(Y);   % imaginary part of Y

% real part of X1
X1r = 0.5 * (Yr(1 : N) + [0, Yr(N : -1 : 2)]);
X1r(1) = Yr(1);

% imaginary part of X1
X1i = 0.5 * (Yi(1 : N) - [0, Yi(N : -1 : 2)]);
X1i(1) = 0;

% real part of X2
X2r = 0.5 * (Yi(1 : N) + [0, Yi(N : -1 : 2)]);
X2r(1) = Yi(1);

% imaginary part of X2
X2i = 0.5 * (Yr(1 : N) - [0, Yr(N : -1 : 2)]);
X2i(1) = 0;

% spectrum of signals x1 and x2
X1 = X1r + 1i*X1i;
X1 = spectrumShift(X1);
X2 = X2r + 1i*X2i;
X2 = spectrumShift(X2);

% plot X1
X1_matlab = fft(x1);
X1_matlab = fftshift(X1_matlab);
figure;

subplot(211);
plot(f, abs(X1_matlab));
title("X1 matlab");
xlabel("f [Hz]");

subplot(212);
plot(f, abs(X1));
title("X1");
xlabel("f [Hz]");

% plot X2
X2_matlab = fft(x2);
X2_matlab = fftshift(X2_matlab);
figure;

subplot(211);
plot(f, abs(X2_matlab));
title("X2 matlab");
xlabel("f [Hz]");

subplot(212);
plot(f, abs(X2));
title("X2");
xlabel("f [Hz]");

