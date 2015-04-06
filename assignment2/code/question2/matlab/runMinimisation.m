%% script to run minimize to get best parameters
close all; clear all;
load representational;
X = Y * R;  % defined in question

rng(10)
nSub = 200;
Xsubset = X(1:nSub,:);
initialParams = randn(65536,1);

[loggedFinalParams, functionProgess, nIter] = minimize(initialParams, @assessLogLikelihood, -100, Xsubset)

save(['finalParamsRun_' num2str(nSub)], 'loggedFinalParams', 'functionProgess', 'nIter');
