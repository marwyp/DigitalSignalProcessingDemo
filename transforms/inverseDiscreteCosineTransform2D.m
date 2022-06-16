function [x] = inverseDiscreteCosineTransform2D(X)
%INVERSEDISCRETECOSINETRANSFORM2D computes inverse 2D
% discrete cosine transform x of given matrix X

X = double(X);
% size of matrix x
s = size(X);
x = zeros(s(1), s(2));

% cols
for i = 1 : s(2)
    col = X(:, i);
    COL = inverseDiscreteCosineTransform(col);
    x(:, i) = COL;
end

% rows
for i = 1 : s(1)
    row = x(i, :);
    ROW = inverseDiscreteCosineTransform(row);
    x(i, :) = ROW;
end
end

