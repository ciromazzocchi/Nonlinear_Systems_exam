function [] = Model_evolution_PWS(x0,tf,mu,beta,gamma,delta)    
    % Trajectory
    simout = sim('SIR_PWS_model');
    t = simout.x.Time; t(1,:) = [];
    S = simout.x.Data(:,1); S(1,:) = [];
    I = simout.x.Data(:,2); I(1,:) = [];
    R = 1 - S - I;

    %Plot
    figure();
    plot(t,S,'y'); hold on;
    plot(t,I,'r'); hold on;
    plot(t,R,'g'); hold on;
    plot([t(1,1); t(end,1)],[delta; delta], ...
        'Color','#EDB120','LineStyle','--');

    % Figure paramters
    R0 = beta/(gamma+mu);

    if R0 < 1
        title("Time evolution - R_0 < 1");
    elseif R0 == 1
        title("Time evolution - R_0 = 1");
    elseif R0 > 1 && R0 < 1+delta*beta/mu
        title("Time evolution - 1+δ*(β/μ) > R_0 > 1");
    elseif R0 == 1+delta*beta/mu
        title("Time evolution - R_0 = 1+δ*(β/μ)");
    else
        title("Time evolution - R_0 > 1+δ*(β/μ)");
    end
    
    legend({'Susceptible','Infected','Removed','Discontinuty surface'});
    xlabel('t [day]');
    ylabel('S,I,R [%]');
    ylim([0 1]);
end

