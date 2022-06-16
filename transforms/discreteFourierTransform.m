function [X] = discreteFourierTransform(x, mode)
% DISCRETEFOURIERTRANSFORM computes  discrete Fourier
% transform X of given signal x
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
elseif mode == "fft"
    % TODO
end
end

