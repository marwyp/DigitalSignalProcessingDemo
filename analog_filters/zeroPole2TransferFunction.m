function [b, a] = zeroPole2TransferFunction(z, p, k)
%ZEROPOLE2TRANSFERFUNCTION convert zero-pole-gain
% filter parameters to transfer function form

% poly returns the coefficients of the polynomial
b = poly(z);
a = poly(p);

% same length
len_diff = length(a) - length(b);
b = [zeros(1, len_diff), b];

% gain k
b = k * b;
end

