%% Script for Q3
% eng-188do, April 2015
%question3: initial script ccalulates all the calc intensive bits.

clear all; close all;


load finalParamsRun_12000
load representational
X = Y * R;  % defined in question
[ aMatrix, bColVector ] = unlogParams( loggedFinalParams, 256);

sigmak_storage = nan(size(X,2),size(X,1));
% chunckSize = size(X,1)/40;  %breaks in perfefcftly into 40
% % do the next bit in chuncks
% for i=1:floor(size(X,1)/chunckSize)
%     chunkIndices = [(i-1)*(chunckSize)+1:i*chunckSize];
%     Xrepeated = permute(X(chunkIndices, :),[2, 3, 1]);
%     Xrepeated = repmat(Xrepeated, 1, 256, 1);
%     
%     xks = aMatrix * Xrepeated.^2;
%     xks= xks + repmat(bColVector, 1, 1,chunckSize) % check this one.
%     sigmak_storage(:,1,chunkIndices)=xks;
% end

parfor i = 1:size(X,2)
    Xrepeated = permute(X(i,:),[2, 1]);
    %Xrepeated = repmat(Xrepeated, 1, 256);
    xks = aMatrix * Xrepeated.^2;
    xks = xks + bColVector;
    sigmak_storage(:,i) = sqrt(xks);
end

C = X ./ sigmak_storage';

save('question3_cResults','C')