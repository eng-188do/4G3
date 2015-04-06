%%Create plot of Q5
% eng-188do
% April 2015

imageMainComponent = W(:,200);
imageSurroundingComps = (W(:,141) + W(:,62) + W(:,256))/3; %avg of three.
imageSurroundingComps = (W(:,64) + W(:,124) + W(:,113))/3; %avg of three.

nLevels = 10;
nScales = 4;
resultStorage = nan(nLevels,nScales);
levelStorage = nan(nLevels,1); 

scaleForSurroundingVals = [0.01, 0.05, 0.1, 0.5];
for j = 1:nScales
    scaleForSurrounding = scaleForSurroundingVals(j);
    for i=1:nLevels
        level = 0.1 * (i-1);
        levelStorage(i) = level;
        imageInstance = imageMainComponent * level + scaleForSurrounding * imageSurroundingComps;
        imageInstance = imageInstance';
        response = imageInstance * R;
        sigma200 = aMatrix(200,:) * response'.^2 + bColVector(200);
        response = response(200)/sqrt(sigma200);
        resultStorage(i,j) = response;
    end
end


figure
plot(levelStorage, resultStorage(:,1),'-o')
hold on
plot(levelStorage, resultStorage(:,2),'-.x')
plot(levelStorage, resultStorage(:,3),':d')
plot(levelStorage, resultStorage(:,4),'--s')
xlabel('Factor in front of generative weight for k=200')
ylabel('Normalised Response, c_{200}')
legendVals ={};
for i =1:nScales
    legendVals{i} = num2str(scaleForSurroundingVals(i));
end
legend(legendVals)

    