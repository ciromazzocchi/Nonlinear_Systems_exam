function [] = plotVectorField(mu,beta,gamma,delta,PWS)
    [xs,xi] = meshgrid(0:0.05:1.1,-0.1:0.05:1);
    [r,c] = size(xs);
    Sd = zeros(r,c);
    Id = zeros(r,c);
    for i=1:r
        for j=1:c
            if (PWS == 1)
                dxdt = SIR_PWS(0,[xs(i,j) xi(i,j)],mu,beta,gamma,delta);
            else
                dxdt = SIR(0,[xs(i,j) xi(i,j)],mu,beta,gamma);
            end
            Sd(i,j) = dxdt(1);
            Id(i,j) = dxdt(2);
        end
    end
    quiver(xs,xi,Sd,Id);
end

