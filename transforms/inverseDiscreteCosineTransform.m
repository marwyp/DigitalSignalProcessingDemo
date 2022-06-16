function [x] = inverseDiscreteCosineTransform(X)
%INVERSEDISCRETECOSINETRANSFORM computes 
% inverse discrete cosine
% transform x of given spectrum X

N = length(X);

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



% synthesis matrix
S = A';

% idft
s = size(X);
if (s(1) < s(2))
    X = X';
end
x = S * X;
x = x';

end

