%%questionII_1c

clear all; close all;
rng(200);
x=CorrelatedInput();
W=Learn(x, 1e-4);

PlotResults(x, W)