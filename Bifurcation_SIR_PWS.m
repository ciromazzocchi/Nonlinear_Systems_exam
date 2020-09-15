clear all;
close all;
clc;

addpath('./utility');

%% Define parameter of simulation
beta = 0.4;
mu = 0.2;
delta = 0.1;

lim1 = [beta/(1+mu) 1];
lim2 = [1 1+delta*beta/mu];
lim3 = [1+delta*beta/mu beta/mu];

%% Define variable
R0 = sym('R0');

%% Define function
Sne = 1+0*R0;
Ine = 0*R0;
Se = 1/R0;
Ie = (mu/beta)*(R0-1);
Spe = 1 - (delta/mu)*(beta/R0);
Ipe = delta;

%% Plot S
figure()
[p1, ~, ~] = fplot_PWS(R0,[Sne Se Spe],lim1,["" "--" "."]);
[~, p5, ~] = fplot_PWS(R0,[Sne Se Spe],lim2, ["--" "" "."]);
[~, ~, p9] = fplot_PWS(R0,[Sne Se Spe],lim3, ["--" "." ""]);

% Figure paramters
xlabel('R_0');
ylabel('S');
title('PWS Bifurcation - S');
legend([p1 p5 p9],{'Not endemic equilibrium','Endemic equilibrium','Pseudo-equilibrium'});

%% Plot S
figure()
[p1, p5, ~] = fplot_PWS(R0,[Ine Ie Ipe],lim1,["" "--" "."]);
[~, ~, ~] = fplot_PWS(R0,[Ine Ie Ipe],lim2, ["" "" "."]);
[~, ~, p9] = fplot_PWS(R0,[Ine Ie Ipe],lim3, ["" "." ""]);

% Figure paramters
xlabel('R_0');
ylabel('I');
title('PWS Bifurcation - I');
legend([p1 p5 p9],{'Not endemic equilibrium','Endemic equilibrium','Pseudo-equilibrium'});

%% Clean
rmpath('./utility');