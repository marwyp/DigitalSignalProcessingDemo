% example1
% Hilbert filter compared to Matlab
% hilbert function
clearvars; close all;

% signal generation
frequencies = [10, 20, 30];
fs = 1000;                  % Sampling frequency;
N = 2048;                   % Number of samples
t = (0 : N - 1) * 1/fs;     % Time samples
x = 0;                      % Signal
for f = frequencies
    x = x + cos(2 * pi * f * t);
end

% data
M = 64;
N = 2 * M + 1;
window = blackman(N);

% filtering
x_filtered = hilbertFilter(x, M, window);
x_filtered_Matlab = hilbert(x);
x_filtered_Matlab = imag(x_filtered_Matlab);

% comparison
error = abs(x_filtered_Matlab - x_filtered);

figure;

subplot(311);
plot(t, x_filtered);
title("hilbertFilter function");
xlabel("t [s]");
ylabel("x")

subplot(312);
plot(t, x_filtered_Matlab);
title("hilbert Matlab function");
xlabel("t [s]");
ylabel("x")

subplot(313);
plot(t, error);
title("error");
xlabel("t [s]");
ylabel("error")
