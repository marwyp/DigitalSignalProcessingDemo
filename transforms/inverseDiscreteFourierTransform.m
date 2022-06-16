function [x] = inverseDiscreteFourierTransform(X)
% INVERSEDISCRETEFOURIERTRANSFORM computes 
% inverse discrete Fourier transform x
% of given spectrum X

N = length(X);

% analysis matrix
k = 0 : N - 1;
n = 0 : N - 1;
A = exp(-(1i * 2 * pi * k' * n) / N);

% synthesis matrix
S = A';

% idft
s = size(X);
if (s(1) > s(2))
    X = X';
end
x = X * S;
end

