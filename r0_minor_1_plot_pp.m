clear all;
close all;
clc;

addpath('./utility');

%% Define parameter of simulation
beta = 0.4;
gamma = 0.3;
mu = 0.2;

%% Define initial point
[S,I,x0] = getInitialPoint();

%% Plot
% Print ROI
fig = figure();
hold on
plot([0 1 0 0 0 1], [0 0 0 1 1 0], 'g');

% Plot vector field
[xs,xi,Sd,Id] = getMesh(S,I,mu,beta,gamma);

quiver(xs,xi,Sd,Id);

% Plot equilibrium point
scatter(1,0,'b','filled');
hold off

% Plot trajectory
odefun = @(t,x) SIR(t,x,mu,beta,gamma);
printTrajectory(fig,x0,odefun);

% Figure paramters
legendLabel = {'Region of interest','Vector field','Equilibrum point'};
setFigure(fig,"Phase Portrait - R_0 < 1",legendLabel);