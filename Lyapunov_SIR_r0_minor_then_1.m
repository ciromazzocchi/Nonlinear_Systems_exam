clear all;
close all;
clc;

addpath('./utility');

%% Define parameter of simulation
beta = 0.4;
gamma = 0.3;
mu = 0.2;

%% Start
xs = sym('x','real');
xi = sym('y','real');

xse = 1;
xie = 0;
        
V = 0.0000001*xs+xi+0.1;
Vd = (beta*xs*xi-xi*(gamma+mu));

% Plot V
plotLyapunov(V,[xs xi],[xse xie],"V","R_0 < 1",[0 1 0 1]);

% Plot Vd
plotLyapunov(Vd,[xs xi],[xse xie],"Vd","R_0 < 1",[0 1 0 1]);

%% Clean
rmpath('./utility');