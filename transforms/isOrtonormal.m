function [ortonormal, ortogonal, X] = isOrtonormal(matrix)
% init
ortonormal = false;
ortogonal = false;

% compute
X = matrix * matrix';
X = round(X, 12);

% if X is diagonal matrix then ortogonal is true
if isdiag(X)
    ortogonal = true;
end

% if X is identity matrix then ortonomal is true
s = size(matrix);
if X == eye(s(1), s(2))
    ortonormal = true;
end
end