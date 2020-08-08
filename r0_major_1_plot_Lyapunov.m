clear all;
close all;
clc;

addpath('./utility');

%% Define parameter of simulation
beta = 0.4;
gamma = 1/14;
mu = 0.2;

%% Lyapunov function
V = @(xs,xi,xse,xie) real(xs - xse*log(xs/xse) + xi - xie*log(xi/xie));
Vd = @(xs,xi,xse,xie) real( (1- xse./xs).*(mu-mu*xs-beta*xi.*xs) + ...
    (1-xie./xi).*(beta*xs.*xi-xi*(gamma+mu)));

[xs,xi] = meshgrid(0.01:0.01:1,0.01:0.01:1);
xe = [(gamma+mu)/beta, (mu/beta)*(beta/(gamma+mu) - 1)];

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
setFigure(fig,"V - R_0 > 1",legendLabel);
hold off

%% Plot Vd
fig = figure();

% Plot equilibrium point
scatter3(xe(1,1),xe(1,2), V(xe(1,1),xe(1,2),xe(1,1),xe(1,2)),'b','filled');
hold on

% Print ROI
plot3([0 1 0 0 0 1], [0 0 0 1 1 0], [0 0 0 0 0 0] , 'g');

% Plot V
surf(xs,xi,Vd(xs,xi,xe(1,1),xe(1,2)));

% Figure paramters
legendLabel = {'Equilibrum point', 'Region of interest', 'V dot'};
setFigure(fig,"V dot - R_0 > 1",legendLabel);
hold off