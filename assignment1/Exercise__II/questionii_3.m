
rng(0)
x=SparseInput();

results=nan(1,720);
for i=1:720
    theta =i/2-180;
    [X,Y] = pol2cart(theta/180*pi,1);
    w=[X, Y];
    res = w *x;
    results(i) = kurtosis(res);
end