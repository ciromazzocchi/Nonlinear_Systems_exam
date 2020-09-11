clear all;
close all;
clc;

addpath('./utility');
addpath('./models');

%% Define parameter of simulation
beta = 0.4;
mu = 0.2;
delta = 0.1;
S0 = 0.7;
tf = 50;
x0 = [S0; 1-S0];
gamma_case = [0.3, 0.19, 1/14];
titleLabel = ["Time evolution - R_0 < 1"; "Time evolution - 1+δ*(β/μ) > R_0 > 1";
    "Time evolution - R_0 > 1+δ*(β/μ)"];

%% Start
for i=1:max(size(gamma_case))
    % Trajectory
    gamma = gamma_case(i);
    simout = sim('SIR_PWS_model');
    t = simout.x.Time; t(1,:) = [];
    S = simout.x.Data(:,1); S(1,:) = [];
    I = simout.x.Data(:,2); I(1,:) = [];
    R = 1 - S - I;

    %Plot
    figure();
    plot(t,S,'y'); hold on;
    plot(t,I,'r'); hold on;
    plot(t,R,'g'); hold on;
    plot([t(1,1); t(end,1)],[delta; delta], ...
        'Color','#EDB120','LineStyle','--');

    % Figure paramters
    title(titleLabel(i));
    legend({'Susceptible','Infected','Removed','Discontinuty surface'});
    xlabel('t [day]');
    ylabel('S,I,R [%]');
    ylim([0 1]);
end

%% Clean
rmpath('./utility');
rmpath('./models');