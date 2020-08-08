function setFigure(fig,titleLabel,legendLabel)
    figure(fig);
    title(titleLabel);
    xlabel('S');
    ylabel('I');
    xlim([0 1.1]);
    ylim([-0.1 1]);
    legend(legendLabel);
end

