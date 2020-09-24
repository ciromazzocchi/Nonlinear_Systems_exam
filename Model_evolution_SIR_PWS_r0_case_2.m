%
%   This script plots time evolution of PWS SIR model for 1 < R0 < 1+δ*(β/μ)
%

clear;
close all;
clc;

addpath('./utility');
addpath('./models');

%% Define parameter of simulation
beta = 0.4;
mu = 0.2;
gamma = 0.19;
delta = 0.1;
S0 = 0.6;
tf = 50;

%% Start
x0 = [S0; 1-S0];
Model_evolution_PWS(x0,tf,mu,beta,gamma,delta);

%% Clean
rmpath('./utility');
rmpath('./models');