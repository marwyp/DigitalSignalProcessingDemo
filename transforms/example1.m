% example 1
% This example shows different methods of computing
% discrete Fourier transform and comparison to
% Matlab fft function
clear all; close all;

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
f = (0 : N - 1) * fs / N;   % frequencies in dft
f = f - fs / 2;

% plot signal
plot(t, x);
title("Signal x");
xlabel("t [s]");

% matlab
X_matlab = fft(x) / N;
X_matlab = fftshift(X_matlab);

% dft
X_dft = discreteFourierTransform(x, "dft") / N;
X_dft = spectrumShift(X_dft);
error = max(abs(X_dft) - abs(X_matlab));
disp("dft error = " + error);

% plot spectrum
lim = [-max(frequencies) - 2, max(frequencies) + 2];
XList = [X_dft; X_matlab];
titles = ["dft", "matlab"];
xl = "f [Hz]";
shape = [2, 1];
figure;

for i = 1 : length(titles)
    subplot(shape(1), shape(2), i);
    plot(f, abs(XList(i, :)));
    title(titles(i));
    xlabel(xl);
    xlim(lim);
end