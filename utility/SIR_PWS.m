function [dxdt] = SIR_PWS(t,x,mu,beta,gamma,delta)
    xs = x(1);
    xi = x(2);
    dxdt = zeros(size(x));
    
    if xi < delta
        dxdt(1) = mu - mu*xs - beta*xs*xi;
        dxdt(2) = beta*xs*xi - (gamma + mu)*xi;
    elseif xi > delta
        dxdt(1) = mu - mu*xs;
        dxdt(2) = -(gamma + mu)*xi;
    else
        dxdt(1) = mu - mu*xs - beta*xs*xi + mu - mu*xs;
        dxdt(2) = beta*xs*xi - (gamma + mu)*xi -(gamma + mu)*xi;
    end
end