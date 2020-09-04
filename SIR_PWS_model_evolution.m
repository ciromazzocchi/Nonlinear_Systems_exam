clear all;
close all;
clc;

addpath('./utility');

%% Define parameter of simulation
beta = 0.4;
mu = 0.2;
delta = 0.1;

gamma1 = 0.3;
gamma2 = 0.19;
gamma3 = 1/14;

S0 = 0.70;
tf = 50;

%% R0 < 1
% Trajectory
odefun = @(t,x) SIR_PWS(t,x,mu,beta,gamma1,delta);
[t,x] = ode45(odefun,[0 tf],[S0,1-S0]);
S = x(:,1);
I = x(:,2);
R = 1 - S - I;

% Plot
figure();
plot(t,S,'y'); hold on;
plot(t,I,'r'); hold on;
plot(t,R,'g'); hold on;

% Figure properties
title("Time evolution - R_0 < 1");
legend({'Susceptible','Infected','Removed'});
xlabel('t [day]');
ylabel('S,I,R [%]');
ylim([0 1]);

%% 1+δ*(β/μ) > R0 > 1 
% Trajectory
odefun = @(t,x) SIR_PWS(t,x,mu,beta,gamma2,delta);
[t,x] = ode45(odefun,[0 tf],[S0,1-S0]);
S = x(:,1);
I = x(:,2);
R = 1 - S - I;

% Plot
figure();
plot(t,S,'y'); hold on;
plot(t,I,'r'); hold on;
plot(t,R,'g'); hold on;

% Figure properties
title("Phase Portrait - 1+δ*(β/μ) > R_0 > 1");
legend({'Susceptible','Infected','Removed'});
xlabel('t [day]');
ylabel('S,I,R [%]');
ylim([0 1]);

%% R0 > 1+δ*(β/μ)
% Trajectory
odefun = @(t,x) SIR_PWS(t,x,mu,beta,gamma3,delta);
[t,x] = ode45(odefun,[0 tf],[S0,1-S0]);
S = x(:,1);
I = x(:,2);
R = 1 - S - I;

% Plot
figure();
plot(t,S,'y'); hold on;
plot(t,I,'r'); hold on;
plot(t,R,'g'); hold on;

% Figure properties
title("Phase Portrait - R_0 > 1+δ*(β/μ)");
legend({'Susceptible','Infected','Removed'});
xlabel('t [day]');
ylabel('S,I,R [%]');
ylim([0 1]);

%% Clean
rmpath('./utility');