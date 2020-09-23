function [] = Model_evolution(modelName,x0,tf,mu,beta,gamma)    
    % Trajectory
    simout = sim(modelName);
    t = simout.x.Time;
    S = simout.x.Data(:,1);
    I = simout.x.Data(:,2);
    R = 1 - S - I;

    %Plot
    figure();
    plot(t,S,'y'); hold on;
    plot(t,I,'r'); hold on;
    plot(t,R,'g'); hold on;

    % Figure paramters
    R0 = beta/(gamma+mu);

    if R0 < 1
        title("Time evolution - R_0 < 1");
    elseif R0 > 1
        title("Time evolution - R_0 > 1");
    else
        title("Time evolution - R_0 = 1");
    end

    legend({'Susceptible','Infected','Removed'});
    xlabel('t [day]');
    ylabel('S,I,R [%]');
    ylim([0 1]);
end

