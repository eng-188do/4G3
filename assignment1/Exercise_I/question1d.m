%%Question 1d
[ D, Dreshaped, r0, unscaled ] = findBestKernel( S, R, 50 );
%[ D, Dreshaped, unscaled ] = findBestKernel2( S, R, 50 );
[ Smatrix ] = unpackS( S, 50 );

predictedByLinearKernel = D*Smatrix+r0;

figure
%plot(predictedByLinearKernel,'rx')
%plot(unscaled*Smatrix, R-r0,'rx')
plot(D*Smatrix, R-r0,'rx')
hold on

