function [S,I,x0] = getInitialPoint()
passo = 0.11;
sp = -0.1;
ep = 1.3;

S = (sp:passo:ep)';
I = (sp:passo:ep)';
x0 = [S   I(1,1)*ones(size(S)); S(end,1)*ones(size(I)) I;
      S I(end,1)*ones(size(S));   S(1,1)*ones(size(I)) I];
%x0 = [S   zeros(size(S)); zeros(size(I)) I; S 1-S];
end

