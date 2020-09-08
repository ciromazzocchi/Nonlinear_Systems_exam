clear all;
close all;
clc;

addpath('./utility');

%% Define parameter of simulation
beta = 0.4;
mu = 0.2;

lim1 = [beta/(1+mu) 1];
lim2 = [1 beta/mu];

%% Define variable
R0 = sym('R0');

%% Define function
Sne = 1+0*R0;
Ine = 0*R0;
Se = 1/R0;
Ie = (mu/beta)*(R0-1);

%% Plot S
figure()
fplot(R0,Se,lim1,'--b'); hold on;
p2 = fplot(R0,Sne,lim1,'r'); hold on;
p3 = fplot(R0,Se,lim2,'b'); hold on;
fplot(R0,Sne,lim2,'--r'); hold on;

% Figure paramters
xlabel('R_0');
ylabel('S');
title('Bifurcation - S');
legend([p2 p3],'Not endemic equilibrium', 'Endemic equilibrium');

%% Plot I
figure()
fplot(R0,Ie,lim1,'--b'); hold on;
p2 = fplot(R0,Ine,lim1,'r'); hold on;
p3 = fplot(R0,Ie,lim2,'b'); hold on;
fplot(R0,Ine,lim2,'--r'); hold on;

% Figure paramters
xlabel('R_0');
ylabel('I');
title('Bifurcation - I');
legend([p2 p3],'Not endemic equilibrium', 'Endemic equilibrium');

%% Clean
rmpath('./utility');