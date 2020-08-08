clear all;
close all;
clc;

addpath('./utility');

%% Define parameter of simulation
beta = 0.4;
gamma = 0.3;
mu = 0.2;

%% Lyapunov function
V = @(xs,xi,xse,xie) (xs-xse).^2+xi.^2;
Vd = @(xs,xi,xse,xie) 2*(xs-xse).*(mu-mu*xs-beta*xi.*xs) + ...
    2*xi.*(beta*xs.*xi-xi*(gamma+mu));

[xs,xi] = meshgrid(0.01:0.01:1,0.01:0.01:1);
xe = [1 0];

%% Plot V
fig = figure();

% Plot equilibrium point
scatter3(xe(1,1),xe(1,2), V(xe(1,1),xe(1,2),xe(1,1),xe(1,2)),'b','filled');
hold on

% Print ROI
plot3([0 1 0 0 0 1], [0 0 0 1 1 0], [0 0 0 0 0 0] , 'g');

% Plot V
surf(xs,xi,V(xs,xi,xe(1,1),xe(1,2)));

% Figure paramters
legendLabel = {'Equilibrum point', 'Region of interest', 'Lyapunov V'};
setFigure(fig,"V - R_0 < 1",legendLabel);
hold off

%% Plot Vd
fig = figure();

% Plot equilibrium point
scatter3(xe(1,1),xe(1,2), Vd(xe(1,1),xe(1,2),xe(1,1),xe(1,2)),'b','filled');
hold on

% Print ROI
plot3([0 1 0 0 0 1], [0 0 0 1 1 0], [0 0 0 0 0 0] , 'g');

% Plot V
surf(xs,xi,Vd(xs,xi,xe(1,1),xe(1,2)));

% Figure paramters
legendLabel = {'Equilibrum point', 'Region of interest', 'V dot'};
setFigure(fig,"V dot - R_0 < 1",legendLabel);
hold off