clear all;
close all;
clc;

addpath('./utility');
addpath('./models');

%% Define parameter of simulation
beta = 0.4;
mu = 0.2;
gamma = 0.3;
S0 = 0.6;
tf = 50;

%% Start
x0 = [S0, 1-S0];

Model_evolution(x0,tf,mu,beta,gamma);

%% Clean
rmpath('./utility');
rmpath('./models');