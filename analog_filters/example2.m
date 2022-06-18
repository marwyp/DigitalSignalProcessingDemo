% example 2
% Butterworth lowpass analog filter characteristic
clearvars; close all;

% filter design
N = 8;          % filter order
w = 0 : 1000;    % angular frequency
w3dB = 300;     % cutoff frequency in rad/s
[z, p] = analogButterworthZerosPolesLP(N, w3dB);
[b, a] = zeroPole2TransferFunction(z, p, 1);
H = analogFrequencyResponse(b, a, w);
H = H / max(H);

% matlab analog butterworth filter
[z_matlab, p_matlab, k_matlab] = ...
    butter(N, w3dB, 's');
[b_matlab, a_matlab] = ...
    zp2tf(z_matlab, p_matlab, k_matlab);
H_matlab = freqs(b_matlab, a_matlab, w);

% plot characteristic
figure;

subplot(221);
plot(w, abs(H));
title("8-order Butterworth filter");
ylabel("|H(j\omega)|");
xlabel("\omega [rd/s]");
grid on;

subplot(222);
plot(w, abs(H_matlab));
title("Matlab 8-order Butterworth filter");
ylabel("|H(j\omega)|");
xlabel("\omega [rd/s]");
grid on;

subplot(223);
plot(w, unwrap(angle(H)));
title("8-order Butterworth filter");
ylabel("\Phi(j\omega) [rd]");
xlabel("\omega [rd/s]");
grid on;

subplot(224);
plot(w, unwrap(angle(H_matlab)));
title("Matlab 8-order Butterworth filter");
ylabel("\Phi(j\omega) [rd]");
xlabel("\omega [rd/s]");
grid on;

% plot zeros and poles
figure;

subplot(211);
plot(z, "o"); hold on;
plot(p, "*"); hold off;
title("Zeros and poles on the complex plane");
grid on;
xlabel("Real(s)"); ylabel("Imag(s)");

subplot(212);
plot(z_matlab, "o"); hold on;
plot(p_matlab, "*"); hold off;
title("Matlab zeros and poles on the complex plane");
grid on;
xlabel("Real(s)"); ylabel("Imag(s)");
