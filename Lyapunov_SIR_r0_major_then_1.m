%
%   This script plots V and Vdot for a SIR model with R0 > 1
%

clear;
close all;
clc;

addpath('./utility');

%% Define parameter of simulation
beta = 0.4;
gamma = 1/14;
mu = 0.2;

%% Start
xs = sym('x','real');
xi = sym('y','real');

xse = (gamma+mu)/beta;
xie = (mu/beta)*(beta/(gamma+mu) - 1);
        
V = xs - xse*log(xs/xse) + xi - xie*log(xi/xie) -(xse+xie);
Vd = (1- xse/xs)*(mu-mu*xs-beta*xi*xs) + (1-xie/xi).*(beta*xs*xi-xi*(gamma+mu));

% Plot V
plotLyapunov(V,[xs xi],[xse xie],"V","R_0 > 1",[0 1 0 1]);

% Plot Vd
plotLyapunov(Vd,[xs xi],[xse xie],"Vd","R_0 > 1",[0 1 0 1]);

%% Clean
rmpath('./utility');