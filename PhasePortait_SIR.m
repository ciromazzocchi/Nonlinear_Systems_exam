clear all;
close all;
clc;

addpath('./utility');
addpath('./models');

%% Paramter of simulation
beta = 0.4;
mu = 0.2;
gamma = [0.3, 1/14];
tf = 50;

%% Constant of simulation
[S,I,x0] = getInitialPoint();
[n_simulation,~] = size(x0);

%% Start
for i=1:max(size(gamma))
    R0 = beta/(gamma(i)+mu);
    
    % Print ROI
    figure();
    hold on
    plot([0 1 0 0 0 1], [0 0 0 1 1 0], 'Color', 'g', 'LineWidth',1.0);

    % Plot vector field
    [xs,xi,Sd,Id] = getMesh(mu,beta,gamma(i));

    quiver(xs,xi,Sd,Id);

    % Plot equilibrium point
    scatter(1,0,'b','filled');
    if R0 > 1
        scatter((gamma(i)+mu)/beta,mu/(gamma(i) + mu) - mu/beta,'b','filled');
    end

    % Plot trajectory
    odefun = @(t,x) SIR(t,x,mu,beta,gamma(i));
    printTrajectory(x0,odefun);
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