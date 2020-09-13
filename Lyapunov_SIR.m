clear all;
close all;
clc;

addpath('./utility');

%% Define parameter of simulation
beta = 0.4;
gamma = [0.3, 1/14];
mu = 0.2;

%% Start
xs = sym('x','real');
xi = sym('y','real');

for i=1:max(size(gamma))
    R0 = beta/(gamma(i)+mu);
    
    if R0 < 1
        xse = 1;
        xie = 0;
        
        V = 0.0000001*xs+xi+0.1;
        Vd = (beta*xs*xi-xi*(gamma(i)+mu));
        
        R0label = "R_0 < 1";
    else
        xse = (gamma(i)+mu)/beta;
        xie = (mu/beta)*(beta/(gamma(i)+mu) - 1);
        
        V = xs - xse*log(xs/xse) + xi - xie*log(xi/xie) -(xse+xie);
        Vd = (1- xse/xs)*(mu-mu*xs-beta*xi*xs) + (1-xie/xi).*(beta*xs*xi-xi*(gamma(i)+mu));
        
        R0label = "R_0 > 1";
    end
    
    % Plot V
    plotLyapunov(V,[xs xi],[xse xie],"V",R0label,[0 1 0 1]);

    % Plot Vd
    plotLyapunov(Vd,[xs xi],[xse xie],"Vd",R0label,[0 1 0 1]);
end

%% Clean
rmpath('./utility');