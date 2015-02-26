%%question 3b
sClearAll;
load coding
time=0:0.01:0.99;
plot(time, R2,'x');
xlabel('time (secs)')
ylabel('R2 response')
pause


[ D, Dreshaped, r0, unscaled ] = findBestKernel( S, R, 2 );
dcollapsed = sum(sum(Dreshaped));
d_reaaranged = createPostMultiplicationMatrix(dcollapsed, 100);
R2_mod = (1/0.4062) * log( (R2-r0+14.24)/12.71 );
sVector = R2_mod/d_reaaranged;
sVector = repmat(sVector,10,1);
sVector = reshape(sVector,100,1);
plot(sVector,'x')

%try ging back the other way.
pause
S2=ones(4,4,100);
for i=1:length(sVector)
    S2(:,:,i) = sVector(i);
end

j=0;
for i=1:10:91
    j=j+1;
    subplot(1,10,j), imshow(S2(:,:,i),[-1, 1.5],'InitialMagnification',10000)
    title(['Time ' num2str(i*0.01) ' secs'])
end



[ Smatrix ] = unpackS( S2, 2 );
time=0:0.01:0.99;
predicted = 12.71*exp(0.4062*D*Smatrix)-14.24+r0;
plot(time, predicted,'x')
ylabel('predicted firing rate using S1')
xlabel('time (secs)')
hold on
plot(time, R2,'o');
legend('working back', 'actual')
hold off
% for i=1:100
%     subplot(10,10,i), imshow(Snew(:,:,i),[-0.25, 0.25],'InitialMagnification',10000)
%     title(['Time ' num2str(i*0.01) ' secs'])
% end
