clear all;
close all;
clc;

addpath('./utility');
addpath('./models');

%% Define parameter of simulation
beta = 0.4;
mu = 0.2;
gamma_case = [0.3, 1/14];
titleLabel = ["Time evolution - R_0 < 1"; "Time evolution - R_0 > 1"];
S0 = 0.6;
tf = 50;
x0 = [S0, 1-S0];

%% Start
for i=1:max(size(gamma_case))
    % Trajectory
    gamma = gamma_case(i);
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
    title(titleLabel(i));
    legend({'Susceptible','Infected','Removed'});
    xlabel('t [day]');
    ylabel('S,I,R [%]');
    ylim([0 1]);
end

%% Clean
rmpath('./utility');
rmpath('./models');