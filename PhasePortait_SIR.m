%
%   This script plots all three possible phase portait of SIR
%   model varing gamma. 
%

clear;
close all;
clc;

addpath('./utility');
addpath('./models');

%% Paramter of simulation
beta = 0.4;
mu = 0.2;
gamma_case = [0.3, 1/14];
tf = 50;

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
    plotVectorField(mu,beta,gamma,0,0);

    % Plot equilibrium point
    scatter(1,0,'b','filled');
    if R0 > 1
        scatter((gamma+mu)/beta,mu/(gamma + mu) - mu/beta,'b','filled');
    end

    % Plot trajectory
    for j=1:n_simulation
        x0 = x_0(j,:)';
        tf = 50;
        flag = 1;
        while flag
            try
                simout = sim('SIR_model');
                flag = 0;
            catch
                tf = tf - 5;
                if tf <= 0
                    error("tf < 0");
                end
            end
        end
        S = simout.x.Data(:,1);
        I = simout.x.Data(:,2);
        plot(S,I,'b');
    end
    hold off

    % Figure paramters
    if R0 < 1
        title("Phase Portrait - R_0 < 1");
    elseif R0 > 1
        title("Phase Portrait - R_0 > 1");
    else
        title("Phase Portrait - R_0 = 1");
    end
    
    xlabel('S');
    ylabel('I');
    xlim([0 1.1]);
    ylim([-0.1 1]);
    legend({'Region of interest','Vector field','Equilibrum point'});
end

%% Clean
rmpath('./utility');
rmpath('./models');