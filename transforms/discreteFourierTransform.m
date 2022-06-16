function [X] = discreteFourierTransform(x, mode)
% DISCRETEFOURIERTRANSFORM computes  discrete Fourier
% transform X of given signal x
% modes: 
%   dft - using analysis matrix
%   rec - recursive raddix-2 algorithm
%   fft - raddix-2 algorithm
N = length(x);
if mode == "dft"
    % analysis matrix
    k = 0 : N - 1;
    n = 0 : N - 1;
    A = exp(-(1i * 2 * pi * k' * n) / N);

    % dft
    s = size(x);
    if (s(1) > s(2))
        x = x';
    end
    X = x * A;
elseif mode == "rec"
    if mod(N, 2) == 0
        x_even = x(1 : 2 : N);  % even samples
        x_odd = x(2 : 2 : N);   % odd samples
        X_even = discreteFourierTransform(x_even, 'rec');
        X_odd = discreteFourierTransform(x_odd, 'rec');
        X = [X_even, X_even] + ...
        exp(-1i * 2 * pi / N * (0 : N-1)) .*...
        [X_odd, X_odd];
    else
        X = discreteFourierTransform(x, 'dft');
    end    
elseif mode == "fft"
    % TODO
end
end

