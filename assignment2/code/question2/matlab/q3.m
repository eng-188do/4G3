%% Script for Q3
% eng-188do, April 2015
% Second part of Q3 code. Copies a lot from Q1
%run question3 first



%% Part i
% Here we have chose the k compoennts 1, 20 and 187 to plot:
histogram(C(:,1), 25, 'Normalization', 'probability')
kurtosis(C(:,1))
title('p(c_1)')
xlabel('c_1')
ylabel('p(c_1)')


pause
histogram(C(:,20), 25, 'Normalization', 'probability')
kurtosis(C(:,20))
title('p(c_{20})')
xlabel('c_{20}')
ylabel('p(c_{20})')

pause
histogram(C(:,187), 25, 'Normalization', 'probability')
kurtosis(C(:,187))
title('p(c_{187})')
xlabel('c_{187}')
ylabel('p(c_{187}')
pause

%% Part ii part 1 - the 2d histogram
% will plot for k=20 & 187.
% will put 2d logged map underneath to show values - how I do this is
% mainly quoted in the help for hist3
fig = figure;
twoVariables = [C(:,256), C(:,200)];
hist3_2(twoVariables,[30,30]);  % modified function, which normalises for probability
xlabel('c_{20}')
ylabel('c_{187}')
zlabel('p(c_{20}, c_{187})')
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
title('2D histogram plot between c_{20} and c_{187}');
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
xlabel('c_{20}')
ylabel('c_{187}')
title('p(c_{187}|c_{20})')
pause
h = contour(xb,yb,histResultsTranspose);
xlabel('c_{20}')
ylabel('c_{187}')
title('p(c_{187}|c_{20})')
pause

% for comparison we will show what it would like if it was independent:
histogramOf187 = histogram(C(:,187), yb, 'Normalization', 'probability');
values = histogramOf187.Values; %fliplr(histogramOf187.Values)
values = values';
values = repmat(values,1,nBins);
values(nBins+1, nBins+1)=0;
figure
h = pcolor(xb,yb,values);
caxis([0 1])
ylabel('p(c_{187})');
pause

% just checking this is the same thing as y vs x
histogram(C(:,187), yb, 'Normalization', 'probability');
title('p(c_{187})')
xlabel('c_{187}')
ylabel('p(c_{187}')
pause






