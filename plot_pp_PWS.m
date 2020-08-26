clear all;
close all;
clc;

addpath('./utility');

%% Define parameter of simulation
beta = 0.4;
gamma = 1/14;
mu = 0.2;
delta = 0.1;
R0 = beta/(gamma + mu);

%% Print ROI
fig = figure();
hold on
plot([0 1 0 0 0 1], [0 0 0 1 1 0], 'g');

%% Plot vector field
[xs,xi] = meshgrid(0:0.05:1.1,-0.1:0.05:1);
    [r,c] = size(xs);
    Sd = zeros(r,c);
    Id = zeros(r,c);
    for i=1:r
        for j=1:c
            dxdt = SIR_PWS(0,[xs(i,j) xi(i,j)],mu,beta,gamma,delta);
            Sd(i,j) = dxdt(1);
            Id(i,j) = dxdt(2);
        end
    end
quiver(xs,xi,Sd,Id);

%% Plot sigma

if R0 < 1
    hold on
    plot([0 1],[delta delta], 'r--');
    hold off
else
    hold on
    plot([0 1/R0],[delta delta], 'r--');
    hold on
    plot([1/R0 1],[delta delta], 'r');
    hold off
end

%% Plot equilibrium point
if R0 < 1
    roots = [1,0];
elseif 1 > R0 && R0 > 1+delta*beta/mu 
    roots = [1 0; 1/R0 (mu/beta)*(R0-1)];
else
    roots = [1 0; 1-delta*((mu+gamma)/mu) delta];
end
hold on
scatter(roots(:,1),roots(:,2),'b','filled');
hold off

%% Plot trajectory
% Define initial point
x0 = [0.1; 0.1];
fun = @(x) SIR_PWS(0,x,mu,beta,gamma,delta);
roots = fsolve(fun,x0);

% Plot trajectory
[~,~,x0] = getInitialPoint();
[n_row,~] = size(x0);
for ii = 0:n_row-1
    if x0(n_row-ii,2) == delta
        x0(n_row-ii,:) = [];
    end
end
odefun = @(t,x) SIR_PWS(t,x,mu,beta,gamma,delta);
printTrajectory(fig,x0,odefun);
hold off

%% Figure paramters
if R0 < 1
    legendLabel = {'Region of interest','Vector field','Crossing region','Equilibrum point'};
else
    legendLabel = {'Region of interest','Vector field','Crossing region','Sliding region','Equilibrum point'};
end
setFigure(fig,"Phase Portrait - R_0 < 1",legendLabel);

%% Clean
rmpath('./utility');