function PlotResults(x,W)
    figure();
    plot(W');
    
    figure();
    ScatterPlot(x);
    hold on;
    arrow=quiver(0,0,10*W(1,end),10*W(2,end));
    set(arrow,'linewidth',3,'color','red');