clear all;
close all;
clc;

addpath('./utility');

%% Define parameter of simulation
beta = 0.4;
gamma1 = 0.3;
gamma2 = 1/14;
mu = 0.2;

S0 = 0.7;
tf = 50;

%% R0 < 1
% Tracjectory
odefun = @(t,x) SIR(t,x,mu,beta,gamma1);
[t,x] = ode45(odefun,[0 tf],[S0,1-S0]);
S = x(:,1);
I = x(:,2);
R = 1 - S - I;

%Plot
figure();
plot(t,S,'y'); hold on;
plot(t,I,'r'); hold on;
plot(t,R,'g'); hold on;

% Figure paramters
title("Time evolution - R_0 < 1");
legend({'Susceptible','Infected','Removed'});
xlabel('t [day]');
ylabel('S,I,R [%]');
ylim([0 1]);

%% R0 > 1
% Tracjectory
odefun = @(t,x) SIR(t,x,mu,beta,gamma2);
[t,x] = ode45(odefun,[0 tf],[S0,1-S0]);
S = x(:,1);
I = x(:,2);
R = 1 - S - I;

%Plot
figure();
plot(t,S,'y'); hold on;
plot(t,I,'r'); hold on;
plot(t,R,'g'); hold on;

% Figure paramters
title("Time evolution - R_0 > 1");
legend({'Susceptible','Infected','Removed'});
xlabel('t [day]');
ylabel('S,I,R [%]');
ylim([0 1]);


%% Clean
rmpath('./utility');