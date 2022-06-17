function [H] = analogFrequencyResponse(b, a, w)
% ANALOGFREQUENCYRESPONSE frequency response
% of analog filters
Y = polyval(b, 1i * w);
X = polyval(a, 1i * w);
H = Y ./ X;
end

