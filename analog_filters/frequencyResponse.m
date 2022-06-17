function [H] = frequencyResponse(b, a, w)
%FREQUENCYRESPONSE Summary of this function goes here
%   Detailed explanation goes here
Y = polyval(b, 1i * w);
X = polyval(a, 1i * w);
H = Y ./ X;
end

