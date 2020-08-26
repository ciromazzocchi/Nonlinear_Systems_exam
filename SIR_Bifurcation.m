clear all;
close all;
clc;

addpath('./utility');

%% Define parameter of simulation
beta = 0.4;
mu = 0.2;

lim1 = [0 beta-mu];
lim2 = [beta-mu 1];

%% Define variable
gamma = sym('gamma');

%% Define function
Sne = 1+0*gamma;
Ine = 0*gamma;
Se = (gamma+mu)/beta;
Ie = (mu/beta)*((beta/(gamma + mu))-1);

%% Plot S
figure()
fplot(gamma,Se,lim1,'Color','b');
hold on
fplot(gamma,Sne,lim2,'Color','r');
hold on
fplot(gamma,Sne,lim1,'Color','r','LineStyle','--');
hold on
fplot(gamma,Se,lim2,'Color','b','LineStyle','--');

% Figure paramters
xlabel('gamma');
ylabel('S');
title('Bifurcation - S');
legend('endemic equilibrium', 'not endemic equilibrium');

%% Plot I
figure()
fplot(gamma,Ie,lim1,'Color','b');
hold on
fplot(gamma,Ine,lim2,'Color','r');
hold on
fplot(gamma,Ine,lim1,'Color','r','LineStyle','--');
hold on
fplot(gamma,Ie,lim2,'Color','b','LineStyle','--');

% Figure paramters
xlabel('gamma');
ylabel('I');
title('Bifurcation - I');
legend('endemic equilibrium', 'not endemic equilibrium');

%% Clean
rmpath('./utility');