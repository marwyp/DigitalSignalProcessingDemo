function [x] = demodulatorAM(y, k)
% DEMODULATORAM demodulates given signal y
x = hilbert(y);
x = abs(x) * 1/k - 1/k;
end

