%% Script for Q1 
% eng-188do, March 2015
% This script produces all the plots I use in my report. They are all
% plotted in the same figure window but the script is paused after each is
% plotted so that they can be viewed/saved.
% Script rather than function as not too many operations and won't run
% them.
% Not the cleanest code as just using to create plots.
close all; clear all;
load representational

%% Introduction
%plotIm(Y(1:100,:)');
%title('First 100 images')
%pause;
X = Y * R;  % defined in question

%% Part i
% Here we have chose the k compoennts 1, 20 and 187 to plot:
histogram(X(:,1), 25, 'Normalization', 'probability')
kurtosis(X(:,1))
title('p(x_1)')
xlabel('x_1')
ylabel('p(x_1)')

pause
histogram(X(:,20), 25, 'Normalization', 'probability')
kurtosis(X(:,20))
title('p(x_{20})')
xlabel('x_{20}')
ylabel('p(x_{20})')

pause
histogram(X(:,187), 25, 'Normalization', 'probability')
kurtosis(X(:,187))
title('p(x_{187})')
xlabel('x_{187}')
ylabel('p(x_{187}')
pause

%% Part ii part 1 - the 2d histogram
% will plot for k=20 & 187.
% will put 2d logged map underneath to show values - how I do this is
% mainly quoted in the help for hist3
fig = figure;
twoVariables = [X(:,113   ), X(:,200)];
hist3_2(twoVariables,[30,30]);  % modified function, which normalises for probability
xlabel('x_{162}')
ylabel('x_{187}')
zlabel('p(x_{162}, x_{187})')
histogramResults = hist3_2(twoVariables, [30,30]); % default is to 10x10 bins
distBelow = -max(max(histogramResults));
histogramResults = hist3(twoVariables, [30,30]); % default is to 10x10 bins
histogramResults = log(histogramResults);  % logged to make the dist clearer
histResultsTranspose = histogramResults';  % the transpose is due to the different ways pcolor and hist3 work
histResultsTranspose(size(histogramResults,1) + 1, size(histogramResults,2) + 1) = 0;

%Generate grid for 2-D projected view of intensities.
xb = linspace(min(twoVariables(:,1)),max(twoVariables(:,1)),size(histogramResults,1)+1);
yb = linspace(min(twoVariables(:,2)),max(twoVariables(:,2)),size(histogramResults,1)+1);

%Make a pseudocolor plot.
hold on
colormap('default');
h = pcolor(xb,yb,histResultsTranspose);
colormap('default');


%Set the z-level and colormap of the displayed grid, and display the default 3-D perspective view.
h.ZData = ones(size(histResultsTranspose)) * distBelow;
title('2D histogram plot between x_{162} and x_{187}');
grid on
view(3);
hold off
%p = fig2plotly(fig); % put online
pause

%% Part ii final part
% produces the conditional probabilities
nBins = 30;
histogramResults = hist3(twoVariables, [nBins,nBins]); % default is to 10x10 bins
xb = linspace(min(twoVariables(:,1)),max(twoVariables(:,1)),size(histogramResults,1)+1);
yb = linspace(min(twoVariables(:,2)),max(twoVariables(:,2)),size(histogramResults,1)+1);
histogramResults = histogramResults';
sumOfCols = sum(histogramResults);
sumOfCols(sumOfCols==0) = 1;  % set to one as we do not want to divide by zero. (otherwise nan)
normalisingMatrix = repmat(sumOfCols,size(histogramResults,1) ,1);
histogramResultsNorm = histogramResults ./ normalisingMatrix; %normalise wrt to the columns (or x_k1)
histResultsTranspose = histogramResultsNorm;
histResultsTranspose(size(histogramResultsNorm,1) + 1, size(histogramResultsNorm,2) + 1) = 0;
h = pcolor(xb,yb,histResultsTranspose);
caxis([0 1])
xlabel('x_{162}')
ylabel('x_{187}')
title('p(x_{187}|x_{162})')
pause
h = contour(xb,yb,histResultsTranspose);
xlabel('x_{162}')
ylabel('x_{187}')
title('p(x_{187}|x_{154})')
pause

% for comparison we will show what it would like if it was independent:
histogramOf187 = histogram(X(:,187), yb, 'Normalization', 'probability');
values = histogramOf187.Values; %fliplr(histogramOf187.Values)
values = values';
values = repmat(values,1,nBins);
values(nBins+1, nBins+1)=0;
h = pcolor(xb,yb,values);
caxis([0 1])
ylabel('p(x_{187})');
pause

% just checking this is the same thing as y vs x
histogram(X(:,187), yb, 'Normalization', 'probability');
title('p(x_{187})')
xlabel('x_{187}')
ylabel('p(x_{187}')
pause






