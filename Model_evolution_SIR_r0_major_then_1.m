clear all;
close all;
clc;

addpath('./utility');
addpath('./models');

%% Define parameter of simulation
beta = 0.4;
mu = 0.2;
gamma = 1/14;
S0 = 0.6;
tf = 50;

%% Start
x0 = [S0, 1-S0];
modelName = 'SIR_model';
Model_evolution(modelName,x0,tf,mu,beta,gamma);

%% Clean
rmpath('./utility');
rmpath('./models');