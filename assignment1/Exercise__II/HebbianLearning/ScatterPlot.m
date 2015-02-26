function ScatterPlot(x)
    scatter(x(1,:),x(2,:),1);
    set(gca,'PlotBoxAspectRatio',[1 1 1]);
    set(gca,'DataAspectRatio',[1 1 1]);