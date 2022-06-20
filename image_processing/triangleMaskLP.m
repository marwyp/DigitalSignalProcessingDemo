function [H] = triangleMaskLP(M, N, K)
% TRIANGLEMASKLP designs triangle lowpass
% mask for image filtering
% M, N - size of mask
% K - size of triangle

H = zeros(M, N);
for i = 1 : K
    if i > M
        continue;
    end
    for j = 1 : K - i + 1
        if j > M
            continue;
        end
        H(i, j) = 1;
    end
end
end