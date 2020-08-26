function [dxdt] = SIR_PWS(t,x,mu,beta,gamma,delta)
    xs = x(1);
    xi = x(2);
    dxdt = zeros(size(x));
    
    R0 = beta/(gamma+mu);
    
    if xi < delta
        dxdt(1) = mu - mu*xs - beta*xs*xi;
        dxdt(2) = beta*xs*xi - (gamma + mu)*xi;
    elseif xi > delta
        dxdt(1) = mu - mu*xs;
        dxdt(2) = -(gamma + mu)*xi;
    elseif xi == delta && xs > 1/R0
        dxdt(1) = mu - mu*xs - (gamma+mu)*delta;
        dxdt(2) = 0;
    end
end