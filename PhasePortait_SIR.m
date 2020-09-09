clear all;
close all;
clc;

addpath('./utility');
addpath('./models');

%% Paramter of simulation
beta = 0.4;
gamma_r0_minor_1 = 0.3;
gamma_r0_major_1 = 1/14;
mu = 0.2;
tf = 50;

%% Constant of simulation
[S,I,x0] = getInitialPoint();
[n_simulation,~] = size(x0);

%% R0 < 1
gamma = gamma_r0_minor_1;

% Print ROI
figure();
hold on
plot([0 1 0 0 0 1], [0 0 0 1 1 0], 'Color', 'g', 'LineWidth',1.0);

% Plot vector field
[xs,xi,Sd,Id] = getMesh(mu,beta,gamma);

quiver(xs,xi,Sd,Id);

% Plot equilibrium point
scatter(1,0,'b','filled');

% Plot trajectory
odefun = @(t,x) SIR(t,x,mu,beta,gamma);
printTrajectory(x0,odefun);
hold off

% Figure paramters
title("Phase Portrait - R_0 < 1");
xlabel('S');
ylabel('I');
xlim([0 1.1]);
ylim([-0.1 1]);
legend({'Region of interest','Vector field','Equilibrum point'});

%% R0 > 1
gamma = gamma_r0_major_1;

% Print ROI
figure();
hold on
plot([0 1 0 0 0 1], [0 0 0 1 1 0], 'Color', 'g', 'LineWidth',1.0);

% Plot vector field
[xs,xi,Sd,Id] = getMesh(mu,beta,gamma);

quiver(xs,xi,Sd,Id);

% Plot equilibrium point
scatter([1; (gamma+mu)/beta],[0; mu/(gamma + mu) - mu/beta],'b','filled');

% Plot trajectory
odefun = @(t,x) SIR(t,x,mu,beta,gamma);
printTrajectory(x0,odefun);
hold off

% Figure paramters
title("Phase Portrait - R_0 > 1");
xlabel('S');
ylabel('I');
xlim([0 1.1]);
ylim([-0.1 1]);
legend({'Region of interest','Vector field','Equilibrum point'});

%% Clean
rmpath('./utility');
rmpath('./models');