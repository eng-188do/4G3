%%qII-2a
rng(0);
x = SparseInput();
ScatterPlot(x);
xlabel('neuron 1')
ylabel('neuron 2')
W=Learn2(x, 1e-5);
PlotResults(x, W)

% results = nan(1, 2000);
% for i=1:2000
%     W=Learn2(x, 1e-4);
%     
%     [theta ~]=cart2pol(W(1,end), W(2,end));
%     results(i)=theta;
%     if i==1000
%         fprintf('halfway through')
%     end
% end
% 
% save('resultsMATLAB', results);