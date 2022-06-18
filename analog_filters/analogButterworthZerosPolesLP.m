function [z, p] = analogButterworthZerosPolesLP(N, w3dB)
% ANALOGBUTTERWORTHPOLESLP designs a lowpass analog 
% Nth order Butterworth filter with cutoff 
% frequency w3dB in rad/s and 
% returns its zeros and poles

% poles
k = 1 : N;
p = w3dB * exp(1i*((pi/2) + (1/2)*(pi/N)+(k-1)*(pi/N)));

% zeros
z = [];
end

