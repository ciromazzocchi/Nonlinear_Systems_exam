clear all;
close all;
clc;

addpath('./utility');
addpath('./models');

%% Define parameter of simulation
beta = 0.4;
mu = 0.2;
gamma_r0_minor_1 = 0.3;
gamma_r0_major_1 = 1/14;
S0 = 0.6;
tf = 50;
x0 = [S0, 1-S0];

%% R0 < 1
% Trajectory
gamma = gamma_r0_minor_1;
simout = sim('SIR_model');
t = simout.x.Time;
S = simout.x.Data(:,1);
I = simout.x.Data(:,2);
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
gamma = gamma_r0_major_1;
simout = sim('SIR_model');
t = simout.x.Time;
S = simout.x.Data(:,1);
I = simout.x.Data(:,2);
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
rmpath('./models');