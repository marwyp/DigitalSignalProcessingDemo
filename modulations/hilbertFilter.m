function [y] = hilbertFilter(x, M, window)
% HILBERTFILTER filters given signal x using
% Hilbert Filter impulse response

h = hilbertResponse(M, window);
y = conv(x, h);
y = y(M + 1:length(x) + M);
end

