function [X] = discreteFourierTransform(x, mode)
% DISCRETEFOURIERTRANSFORM computes  discrete Fourier
% transform X of given signal x
% modes: 
%   dft - using analysis matrix
%   rec - using recursive raddix-2 algorithm
%   fft - using raddix-2 algorithm, only for data of 2^n length
% fft and real - 
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
    num_of_bits = log2(N);
    % signal decomposition
    indices = zeros(1, N);
    for i = 0 : N - 1
        new_position = dec2bin(i, num_of_bits);
        new_position = flip(new_position);
        new_position = bin2dec(new_position);
        indices(i + 1) = new_position;
    end
    indices = indices + 1;
    X = x(indices);

    % butterfly calculation
    for s = 1 : num_of_bits         % stages
        bw = 2^(s-1);               % butterfly width
        sbb = 2^s;                  % shift between blocks
        nb = N/2^s;                 % number of blocks
        W = exp(-1i*2*pi/2^s);      % correction
        for butterfly = 1 : bw
            Wm = W^(butterfly-1);   % butterfly correction
            for b = 1 : nb          % blocks
                up   = 1      + (butterfly-1) + sbb*(b-1);
                down = 1 + bw + (butterfly-1) + sbb*(b-1);
                temp = X( down ) * Wm;
                X( down ) = X( up ) - temp;
                X( up   ) = X( up ) + temp;
            end
        end
    end
end

