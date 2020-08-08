function [xs,xi,Sd,Id] = getMesh(S,I,mu,beta,gamma)
    [xs,xi] = meshgrid(0:0.1:1.1,-0.1:0.1:1);
    [r,c] = size(xs);
    Sd = zeros(r,c);
    Id = zeros(r,c);
    for i=1:r
        for j=1:c
            dxdt = SIR(0,[xs(i,j) xi(i,j)],mu,beta,gamma);
            Sd(i,j) = dxdt(1);
            Id(i,j) = dxdt(2);
        end
    end
end

