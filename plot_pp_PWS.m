clear all;
close all;
clc;

addpath('./utility');

%% Define parameter of simulation
beta = 0.4;
gamma = 1/14;
mu = 0.2;
delta = 0.1;

%% Plot
% Print ROI
fig = figure();
hold on
plot([0 1 0 0 0 1], [0 0 0 1 1 0], 'g');

% Plot vector field
[xs,xi] = meshgrid(0:0.05:1.1,-0.1:0.05:1);
    [r,c] = size(xs);
    Sd = zeros(r,c);
    Id = zeros(r,c);
    for i=1:r
        for j=1:c
            dxdt = SIR_PWS(0,[xs(i,j) xi(i,j)],mu,beta,gamma,delta);
            Sd(i,j) = dxdt(1);
            Id(i,j) = dxdt(2);
        end
    end
quiver(xs,xi,Sd,Id);

% Plot equilibrium point

%% Define initial point
x0 = [0.1; 0.1];
fun = @(x) SIR_PWS(0,x,mu,beta,gamma,delta);
roots = fsolve(fun,x0);
scatter(roots(1,:)',roots(2,:)','b','filled');


% Plot trajectory
[~,~,x0] = getInitialPoint();
odefun = @(t,x) SIR_PWS(t,x,mu,beta,gamma,delta);
printTrajectory(fig,x0,odefun);
hold off

% Figure paramters
legendLabel = {'Region of interest','Vector field','Equilibrum point'};
setFigure(fig,"Phase Portrait - R_0 < 1",legendLabel);