clear all;
close all;
clc;

addpath('./utility');

%% Define parameter of simulation
beta = 0.4;
gamma = 0.3;
mu = 0.2;

xs = sym('x');
xi = sym('y');
xse = 1;
xie = 0;

%% Lyapunov function
V = (xs-xse)^2+(xi)^2;
Vd = 2*(xs-xse)*(mu-mu*xs-beta*xi*xs)+2*xi*(beta*xs*xi-xi*(gamma+mu));

%% Plot V
plotLyapunov(V,[xs xi],[xse xie],"V",[0 1.5 -1 1]);

%% Plot Vd
plotLyapunov(Vd,[xs xi],[xse xie],"Vd",[0 1.5 -1 1]);