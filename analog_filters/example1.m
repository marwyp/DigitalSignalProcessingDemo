% example 1
% Designing a band-pass filter with
% pole-zero matching method
clearvars; close all;

% poles - central frequency 10rad/s
p = [-0.5 + 1i*9.5,...
     -0.5 - 1i*9.5,...
     -1 + 1i*10,...
     -1 - 1i*10,...
     -0.5 + 1i*10.5,...
     -0.5 - 1i*10.5];

% zeros - frequency attenuation below and above 10rad/s
z = [1i*5,...
    -1i*5,...
     1i*15,...
    -1i*15];

% plot
figure;
subplot(221);
plot(z, "o"); hold on;
plot(p, "*"); hold off;
title("Zeros and poles on the complex plane");
xlim([-1.5, 0.5]); grid on;
xlabel("Real(s)"); ylabel("Imag(s)");

% filter transmittance in frequency domain
w = 0 : 0.01 : 20;      % angular frequency domain
[b, a] = zeroPole2TransferFunction(z, p, 1);
H = analogFrequencyResponse(b, a, w);

% Matlab functions
[b_matlab, a_matlab] = zp2tf(z', p', 1);
H_matlab = freqs(b_matlab, a_matlab, w);

% error
error = max(abs(b - b_matlab));
disp("b error = " + error);
error = max(abs(a - a_matlab));
disp("a error = " + error);
error = max(abs(H) - abs(H_matlab));
disp("H error = " + error);

% Amplitude characteristic
A_H = abs(H);
A_HdB = 20*log10(A_H);

% plot
subplot(223);
plot(w, A_H);
title("Amplitude characteristic");
grid on; ylim([0, 2.5]);
ylabel("|H(j\omega)|"); xlabel("\omega [rd/s]");

subplot(224);
plot(w, A_HdB);
title("Amplitude characteristic");
grid on; ylim([-100, 20]);
ylabel("20log_1_0|H(j\omega)| [dB]");
xlabel("\omega [rd/s]");

% Phase characteristic - strongly not linear
subplot(222);
plot(w, unwrap(angle(H)));
title("Phase characteristic");
grid on; ylim([-4, 4]);
ylabel("\Phi(j\omega) [rd]");
xlabel("\omega [rd/s]");

% change gain to 1
H = H / max(H);
A_HdB = 20*log10(abs(H));

figure;
subplot(211);
plot(w, abs(H));
title("Amplitude characteristic - gain to 1");
grid on; ylim([0, 1]);
ylabel("|H(j\omega)|"); xlabel("\omega [rd/s]");

subplot(212);
plot(w, A_HdB);
title("Amplitude characteristic - gain to 1");
grid on; ylim([-100, 20]);
ylabel("20log_1_0|H(j\omega)| [dB]");
xlabel("\omega [rd/s]");