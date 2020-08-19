clear all;
close all;
clc;

addpath('./utility');

%% Define parameter of simulation
beta = 0.4;
gamma = 0.3;
mu = 0.2;

x = sym('x');
y = sym('y');
xse = 1;
xie = 0;

%% Lyapunov function
% I need to add 0.0001*x because MATLAB doesn't recognise V=y as a function
% of V(x,y)
V = 0.0000001*x+y+0.1;
Vd = (beta*x*y-y*(gamma+mu));

%% Plot V
plotLyapunov(V,[x y],[xse xie],"V",[0 1 0 1]);

%% Plot Vd
plotLyapunov(Vd,[x y],[xse xie],"Vd",[0 1 0 1]);