function [h] = hilbertResponse(M, window)
% HILBERTRESPONSE calculates Hilbert filter
% impulse response
% 2 * M + 1 = size of Hibert Filter

% samples 1 : M, half of impulse response
n = 1 : M;
h = (2/pi) * sin(pi*n/2).^2 ./ n;

% whole impulse response
h=[-h(M:-1:1) 0 h(1:M)];

% multiplication by the window
h = h .* window';
end
