%%Question 1d
close all; clear all;
load coding
[ D, Dreshaped, r0, unscaled ] = findBestKernel( S, R, 50 );

[ Smatrix ] = unpackS( S, 50 );

predicted = 12.71*exp(0.4062*D*Smatrix)-14.24+r0;

figure
cmap=colormap('lines')
hold on
plot(R,'o')
plot(predicted,'x')

xlabel('time steps')
ylabel('output')
legend('real', 'predicted')

figure

xlabel('real firing rate (R)')
ylabel('predicted firing rate using S')
hold on
x=linspace(0, 120 , 1000);
plot(x,x,'--','Color', [160 160 160]/255)
plot(R, predicted, 'x', 'Color', cmap(4,:))
legend('y=x', 'estimated firing rate versus real')