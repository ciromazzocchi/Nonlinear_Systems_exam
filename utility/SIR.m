function [dxdt] = SIR(t,x,mu,beta,gamma)
    dxdt = zeros(size(x));
    dxdt(1) = mu - mu*x(1) - beta*x(1)*x(2);
    dxdt(2) = beta*x(1)*x(2) - (gamma + mu)*x(2);
end