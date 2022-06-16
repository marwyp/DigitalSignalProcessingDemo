function [X] = discreteCosineTransform(x)
% DISCRETECOSINETRANSFORM computes  discrete cosine
% transform X of given signal x
N = length(x);

% analysis matrix
k = 0 : N - 1;
n = 0 : N - 1;
A = zeros(N, N);
for i = k
    if i == 0
        s = sqrt(1/N);
    else
        s = sqrt(2/N);
    end
    w = s * cos(pi * i / N * (n + 0.5));
    A(i + 1, :) = w;
end

% dct
s = size(x);
if (s(1) < s(2))
    x = x';
end
X = A * x;
X = X';
end

