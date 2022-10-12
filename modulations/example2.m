% example2
% Amplitude modulation and demodulation

clearvars; close all;

% data
fs = 1000;                  % Sampling frequency;
N = 2000;                   % Number of samples
t = (0 : N - 1) * 1/fs;     % Time samples
f = (-N/2 : N/2 - 1) * fs/N;   % Frequency samples

% signals generation
frequencies1 = [10, 20, 30];
frequencies2 = [15, 20, 25, 40];
x1 = 0;                     % Signal 1
x2 = 0;                     % Signal 2
for fr = frequencies1
    x1 = x1 + cos(2 * pi * fr * t);
end

for fr = frequencies2
    x2 = x2 + cos(2 * pi * fr * t);
end

% carriers data
fc1 = 100;      Ac1 = 1;
fc2 = 400;      Ac2 = 1;

% modulation
k1 = 0.5;
k2 = 0.3;
[y1, c1] = modulatorAM(x1, k1, fc1, Ac1, fs);
[y2, c2] = modulatorAM(x2, k2, fc2, Ac2, fs);

% Spectrum
X1 = fft(x1)/N;
X1 = fftshift(X1);

Y1 = fft(y1)/N;
Y1 = fftshift(Y1);

C1 = fft(c1)/N;
C1 = fftshift(C1);

X2 = fft(x2)/N;
X2 = fftshift(X2);

Y2 = fft(y2)/N;
Y2 = fftshift(Y2);

C2 = fft(c2)/N;
C2 = fftshift(C2);

% plot x1
figure;

subplot(321);
plot(t, c1);
title("Carrier 1");

subplot(322);
plot(f, abs(C1));
title("Carrier 1 spectrum");

subplot(323);
plot(t, x1);
title("Signal 1 before modulation");

subplot(324);
plot(f, abs(X1));
title("Signal 1 spectrum before modulation");

subplot(325);
plot(t, y1);
title("Signal 1 after modulation");

subplot(326);
plot(f, abs(Y1));
title("Signal 1 spectrum before modulation");

% plot x2
figure;

subplot(321);
plot(t, c2);
title("Carrier 2");

subplot(322);
plot(f, abs(C2));
title("Carrier 2 spectrum");

subplot(323);
plot(t, x2);
title("Signal 2 before modulation");

subplot(324);
plot(f, abs(X2));
title("Signal 2 spectrum before modulation");

subplot(325);
plot(t, y2);
title("Signal 2 after modulation");

subplot(326);
plot(f, abs(Y2));
title("Signal 2 spectrum before modulation");

% demodulation
x1_demod = demodulatorAM(y1, k1);
x2_demod = demodulatorAM(y2, k2);
error1 = abs(x1 - x1_demod);
error2 = abs(x2 - x2_demod);

figure;
subplot(321);
plot(t, x1);
title("x1");

subplot(323);
plot(t, x1_demod);
title("x1 demodulated");

subplot(325);
plot(t, error1);
title("error");

subplot(322);
plot(t, x2);
title("x2");

subplot(324);
plot(t, x2_demod);
title("x2 demodulated");

subplot(326);
plot(t, error2);
title("error");

% sum of modulated signals
y3 = y1 + y2;

% spectrum of y3
Y3 = fft(y3)/N;
Y3 = fftshift(Y3);

% plot
figure;

subplot(211);
plot(t, y3);
title("Signal y3 = y1 + y2");

subplot(212);
plot(f, abs(Y3));
title("Spectrum Y3");

% demodulation of y3
N = 16;
distance = 90;
Wn1 = [(fc1 - distance) / fs * 2 (fc1 + distance) / fs * 2];
Wn2 = [(fc2 - distance) / fs * 2 (fc2 + distance) / fs * 2];
h1 = fir1(N, Wn1, kaiser(N + 1));
h2 = fir1(N, Wn2, kaiser(N + 1));
x31_demod = filtfilt(h1, 1, y3);
x31_demod = demodulatorAM(x31_demod, k1);
x32_demod = filtfilt(h2, 1, y3);
x32_demod = demodulatorAM(x32_demod, k2);

error1 = abs(x1 - x31_demod);
error2 = abs(x2 - x32_demod);

figure;
subplot(321);
plot(t, x1);
title("x1");

subplot(323);
plot(t, x31_demod);
title("x1 demodulated");

subplot(325);
plot(t, error1);
title("error");

subplot(322);
plot(t, x2);
title("x2");

subplot(324);
plot(t, x32_demod);
title("x2 demodulated");

subplot(326);
plot(t, error2);
title("error");
