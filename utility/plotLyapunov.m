function plotLyapunov(fun,x,x_,labelFun,lim)
    figure();
    scatter(x_(1),x_(2),'b','filled');
    hold on
    plot([0 1 0 0 0 1], [0 0 0 1 1 0], 'g');
    hold on;
    fcontour(fun,lim,'LevelStep',0.01);

    title("Plot " + labelFun);
    xlabel('S');
    ylabel('I');
    legend({"Equilibrum point", "Region of interest", "Lyapunov " + labelFun});
    hold off

    % Plot 3D
    figure();
    ve = double(subs(fun,x,x_));
    scatter3(x_(1),x_(2),ve,'b','filled');
    hold on
    plot3([0 1 0 0 0 1], [0 0 0 1 1 0], [0 0 0 0 0 0], 'g');
    hold on;
    fsurf(fun,lim);

    title("Plot " + labelFun);
    xlabel('S');
    ylabel('I');
    zlabel(labelFun);
    legend({"Equilibrum point", "Region of interest", "Lyapunov " + labelFun});
    hold off
end

