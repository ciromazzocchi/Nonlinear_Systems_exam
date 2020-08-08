function printTrajectory(fig,x0,odefun)
    [n_simulation,~] = size(x0);
    tspan = 0:0.1:100;
    figure(fig);
    hold on
    for i=1:n_simulation
        [t,dxdt] = ode45(odefun,tspan,x0(i,:));
        plot(dxdt(:,1),dxdt(:,2),'b');
    end
    hold off
end

