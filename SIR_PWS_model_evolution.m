clear all;
close all;
clc;

addpath('./utility');

%% Define parameter of simulation
beta = 0.4;
gamma = 1/14;
mu = 0.2;
delta = 0.1;

R0 = beta/(gamma+mu);

%% Define initial point
S0 = 0.3;
tf = 50;

%% Tracjectory
odefun = @(t,x) SIR_PWS(t,x,mu,beta,gamma,delta);
[t,x] = ode45(odefun,[0 tf],[S0,1-S0]);
S = x(:,1);
I = x(:,2);
R = 1 - S - I;

%% Plot
% Print ROI
fig = figure();
plot(t,S,'y'); hold on;
plot(t,I,'r'); hold on;
plot(t,R,'g'); hold on;

% Figure paramters
if R0 < 1
    title("Time evolution - R_0 < 1");
else
    title("Phase Portrait - R_0 > 1");
end

legend({'Susceptible','Infected','Removed'});
xlabel('t [day]');

%% Clean
rmpath('./utility');