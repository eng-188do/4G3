function [  ] = crossCorr( S )
%crossCorr Plots the crosscorrelation of each pixel.
%   Part I Q1b

fig=figure;
windowLength=0.01; %10 milliseconds
autoCorrLimits=1; %1 second either side of zero.
xIndices=-autoCorrLimits:windowLength:autoCorrLimits;


sVector=reshape(S,size(S,1)*size(S,2),size(S,3)); %columns are observations in time. rows pixel values
autoCorr=nan(size(sVector,1),length(xIndices)); %storage for functions.
hold on
legendLabels={};
for i=1:size(sVector,1)
    valuesToTry=1:size(sVector,1);
    valuesToTry(valuesToTry == i) = [];
    
    for j=1:size(sVector,1)-1
        other=valuesToTry(j);
        autoCorr(i,:)=xcorr(sVector(i,:), sVector(other,:),autoCorrLimits/windowLength,'coeff');
        plot(xIndices,autoCorr(i,:))
        legendLabels{i}=['Pixel ' num2str(i) ' and ' num2str(other)];
    end
end
legend(legendLabels);
hold off
xlabel('time delay (seconds)')
ylabel('normalised autocorrelation')




end

