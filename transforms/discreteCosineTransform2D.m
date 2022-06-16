function [X] = discreteCosineTransform2D(x)
% DISCRETECOSINETRANSFORM2D computes discrete 
% cosine transform X of given matrix x
x = double(x);
% size of matrix x
s = size(x);
X = zeros(s(1), s(2));

% rows
for i = 1 : s(1)
    row = x(i, :);
    ROW = discreteCosineTransform(row);
    X(i, :) = ROW;
end

% cols
for i = 1 : s(2)
    col = X(:, i);
    COL = discreteCosineTransform(col);
    X(:, i) = COL;
end
end

