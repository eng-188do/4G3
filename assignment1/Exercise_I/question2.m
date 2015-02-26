%%Question 2
close all; clear all;
load coding
[ D, Dreshaped, r0, unscaled ] = findBestKernel( S, R, 50 );

[ Smatrix ] = unpackS( S1, 50 );
time=0:0.01:0.99;
predicted = 12.71*exp(0.4062*D*Smatrix)-14.24+r0;
plot(time, predicted,'x')
ylabel('predicted firing rate using S1')
xlabel('time (secs)')

figure
[ D, Dreshaped, r0, unscaled ] = findBestKernel( S, R, 2 );
[ Smatrix ] = unpackS( S1,2 );
predicted = 12.71*exp(0.4062*D*Smatrix)-14.24+r0;
plot(predicted,'x')
ylabel('predicted firing rate using S1')
xlabel('time steps')


%%
for i=1:24
    subplot(3,8,i), imshow(S1(:,:,i),[-0.25, 0.25],'InitialMagnification',10000)
    title(['Time ' num2str(i*0.01) ' secs'])
end
