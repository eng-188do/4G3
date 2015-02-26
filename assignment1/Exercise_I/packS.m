function [S ]=packS(Smatrix, squareSideLength)
%packS reverse the unpackS function

totalLength = squareSideLength^2;

sVectorised = nan(totalLength, size(Smatrix, 2)); 

for i=1:size(Smatrix, 2) % go along columns
    sVectorised(:,i)=Smatrix(1:totalLength,i);
end

S = reshape(sVectorised,squareSideLength,squareSideLength,size(Smatrix, 2));
end


