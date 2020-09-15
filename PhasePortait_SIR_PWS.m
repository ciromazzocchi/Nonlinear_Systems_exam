clear all;
close all;
clc;

addpath('./utility');
addpath('./models');

%% Paramter of simulation
beta = 0.4;
mu = 0.2;
delta = 0.1;
gamma_case = [0.3, 0.19, 1/14];
titleLabel = ["Phase Portrait - R_0 < 1"; "Phase Portrait - 1+δ*(β/μ) > R_0 > 1";
    "Phase Portrait - R_0 > 1+δ*(β/μ)"];

%% Constant of simulation
[S,I,x_0] = getInitialPoint();
[n_simulation,~] = size(x_0);

%% Start
for i=1:max(size(gamma_case))
    gamma = gamma_case(i);
    R0 = beta/(gamma+mu);
    
    % Print ROI
    figure();
    hold on
    plotROI();

    % Plot vector field
    plotVectorField(mu,beta,gamma,delta,1);

    % Plot equilibrium point
    scatter(1,0,'b','filled');
    if R0 > 1 && R0 < 1+delta*beta/mu
        scatter((gamma+mu)/beta,mu/(gamma + mu) - mu/beta,'b','filled');
    elseif R0 > 1+delta*beta/mu
        scatter(1-delta*(mu+gamma)/mu,delta,'b','filled');
    end
    
    plot([0 2]',[delta delta]', 'Color','#EDB120','LineStyle','--');

    % Plot trajectory
    for j=1:n_simulation
        x0 = x_0(j,:)';
        tf = 50;
        flag = 1;
        while flag
            try
                simout = sim('SIR_PWS_model');
                flag = 0;
            catch
                tf = tf - 5;
                if tf <= 0
                    error("tf < 0");
                end
            end
        end
        S = simout.x.Data(:,1); S(1,:) = [];
        I = simout.x.Data(:,2); I(1,:) = [];
        plot(S,I,'b');
    end
    hold off

    % Figure paramters
    title(titleLabel(i));
    xlabel('S');
    ylabel('I');
    xlim([0 1.1]);
    ylim([-0.1 1]);
    legend({'Region of interest','Vector field','Equilibrum point','Discontinuity Surface'});
end

%% Clean
rmpath('./utility');
rmpath('./models');