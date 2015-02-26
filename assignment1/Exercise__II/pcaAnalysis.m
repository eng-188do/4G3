function [COEFF, SCORE, LATENT] = pcaAnalysis(x,varargin);
%%pca
figure 
hold on
if ~isempty(varargin)
    xotherPlot=varargin{1};
    ScatterPlot(xotherPlot);
end
    
ScatterPlot(x);
[COEFF, SCORE, LATENT] = pca(x');

plot([0, COEFF(1,2)]*LATENT(2),[0, COEFF(2,2)]*LATENT(2),'k','LineWidth',3)
plot([0, COEFF(1,1)]*LATENT(1),[0, COEFF(2,1)]*LATENT(1),'k','LineWidth',3)
hold off
end

