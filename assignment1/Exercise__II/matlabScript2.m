%%qII-2a
rng(0);
x = SparseInput();
%ScatterPlot(x);
%xlabel('neuron 1')
%ylabel('neuron 2')
W=Learn2(x, 1e-4);
%PlotResults(x, W)

results = nan(1, 1000);
for i=1:1000
    W=Learn2(x, 1e-4);

    [theta ~]=cart2pol(W(1,end), W(2,end));
    results(i)=theta;
    if i==500
        fprintf('halfway through')
    end
end

save('resultsMATLAB2', 'results');
exit