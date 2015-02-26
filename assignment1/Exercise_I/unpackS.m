function [ Smatrix ] = unpackS( S, numPast )
%unpackS Unpacks S into a matrix with each S
[n, m, l]=size(S);
sVector=reshape(S,size(S,1)*size(S,2),size(S,3)); %columns are observations in time. rows pixel values

startingLoc=numPast+1;
numberVals=l;
Smatrix=nan((numPast+1)*m*n, numberVals);

for i=1:startingLoc-1 %for initial ones we say stimulus is zero before
    storage=[];
    storage=[storage; sVector(:,i)];
    for j=1:numPast
        if i-j>0 %we have real results to add
            storage=[storage; sVector(:,i-j)];
            
        else %don't have real values to add so we add zeros.
            storage=[storage; zeros(n*m,1)];
        end
    end
    Smatrix(1:end,i)=storage;
end


for i=startingLoc:l
    storage=[]; %TODO: extend past 0 just fill in times with 0 and use reshape rather than complicated concatenating procedure.
    for j=0:numPast
        storage=[storage; sVector(:,i-j)];
    end
    Smatrix(1:end,i)=storage;
end


end

