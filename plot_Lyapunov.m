clear all;
close all;
clc;

addpath('./utility');

clear all;
close all;
clc;

addpath('./utility');

%% Define parameter of simulation
beta = 0.4;
gamma = 1/14;
mu = 0.2;

R0 = beta/(gamma+mu);

xs = sym('x','real');
xi = sym('y','real');

if R0 < 1
    xse = 1;
    xie = 0;
else
    xse = (gamma+mu)/beta;
    xie = (mu/beta)*(beta/(gamma+mu) - 1);
end

%% Lyapunov function
if R0 < 1
    V = 0.0000001*xs+xi+0.1;
    Vd = (beta*xs*xi-xi*(gamma+mu));
else
    V = xs - xse*log(xs/xse) + xi - xie*log(xi/xie);
    Vd = (1- xse/xs)*(mu-mu*xs-beta*xi*xs) + (1-xie/xi).*(beta*xs*xi-xi*(gamma+mu));
end

%% Plot V
plotLyapunov(V,[xs xi],[xse xie],"V",[0 1 0 1]);

%% Plot Vd
plotLyapunov(Vd,[xs xi],[xse xie],"Vd",[0 1 0 1]);

%% Clean
rmpath('./utility');