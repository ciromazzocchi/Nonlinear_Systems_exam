function [p1 p2 p3] = fplot_PWS(var,fun,lim,line)
p1 = fplot(var,fun(1),lim, "r"+line(1)); hold on;
p2 = fplot(var,fun(2),lim, "b"+line(2)); hold on;
p3 = fplot(var,fun(3),lim, "g"+line(3)); hold on;
end

