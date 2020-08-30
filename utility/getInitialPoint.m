function [S,I,x0] = getInitialPoint()
S = (0:0.1:1.1)';
I = (-0.1:0.1:1)';
%x0 = [S   I(1,1)*ones(size(S)); S(end,1)*ones(size(I)) I;
%      S I(end,1)*ones(size(S));   S(1,1)*ones(size(I)) I];
x0 = [S   zeros(size(S)); zeros(size(I)) I; S 1-S];
end

