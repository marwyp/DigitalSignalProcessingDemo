function [XShifted] = spectrumShift(X)
% SPECTRUMSHIFT shifts positive and negative frequencies
% of spectrum
N = length(X);
XShifted = [X(N / 2 + 1 : end), X(1 : N / 2)];
end

