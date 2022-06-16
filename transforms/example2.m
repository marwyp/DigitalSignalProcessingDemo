% example 1
% This example shows different methods of computing
% discrete cosine transform and comparison to
% Matlab dct function
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
f = (0 : N - 1) * fs / (N * 2);   % frequencies in dft

% plot signal
plot(t, x);
title("Signal x");
xlabel("t [s]");

% matlab
X_matlab = dct(x) / N;

% dct
X_dct = discreteCosineTransform(x) / N;
error = max(abs(X_dct - X_matlab));
disp("dct error = " + error);

% plot spectrum
lim = [0, max(frequencies) + 2];
XList = [X_dct; X_matlab];
titles = ["dct", "matlab"];
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