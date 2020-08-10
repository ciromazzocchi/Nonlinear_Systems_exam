clear all;
close all;
clc;

addpath('./utility');

%% Define parameter of simulation
beta = 0.4;
mu = 0.2;

%% Define variable
R0 = sym('R0');

%% Define function
Sne = @(R0) 1;
Ine = @(R0) 0;
Se = @(R0) 1/R0;
Ie = @(R0) (mu/beta)*(R0-1);

%% Plot S
figure()
fplot(R0,Se,[0.1 1],'Color','b');
hold on
fplot(R0,Sne,[1 2],'Color','r');
hold on
fplot(R0,Sne,[0.1 1],'Color','r','LineStyle','--');
hold on
fplot(R0,Se,[1 2],'Color','b','LineStyle','--');

% Figure paramters
xlabel('R0');
ylabel('S');
title('Bifurcation - S');
legend('endemic equilibrium', 'not endemic equilibrium');

%% Plot I
figure()
fplot(R0,Ie,[0.1 1],'Color','b');
hold on
fplot(R0,Ine,[1 2],'Color','r');
hold on
fplot(R0,Ine,[0.1 1],'Color','r','LineStyle','--');
hold on
fplot(R0,Ie,[1 2],'Color','b','LineStyle','--');

% Figure paramters
xlabel('R0');
ylabel('I');
title('Bifurcation - I');
legend('endemic equilibrium', 'not endemic equilibrium');