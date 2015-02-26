function [  ] = plotCovMatrix( S )
%plotCovMatrix plots the coavraince matrix of S
%   answers question 1a and built to spec. there.

sVector=reshape(S,size(S,1)*size(S,2),size(S,3)); %columns are observations in time. rows pixel values
covarianceMat=cov(sVector')'; %covariance matrix.
imshow(covarianceMat,[-0.5, 1.5],'InitialMagnification',10000)
xlabel('i')
ylabel('j')
fig=figure
bar3(covarianceMat);
xlabel('i')
ylabel('j')

end

