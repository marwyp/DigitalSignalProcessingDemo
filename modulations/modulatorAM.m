function [y, c] = modulatorAM(x, k, fc, Ac, fs)
% MODULATORAM modulates given signal x using given
% carrier frequency fc of amplitude Ac and 
% sampling frequency fs

% generate carrier
N = length(x);
t = (0 : N - 1) * 1/fs;
c = cos(2 * pi * fc * t);

% modulate
y = Ac * (1 + k * x) .* c;
end

