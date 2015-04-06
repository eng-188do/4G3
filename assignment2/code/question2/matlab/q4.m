%%simple script to run  plot of q4
k=187
plotIm(W(:,k));

row = aMatrix(k,:);

[rowSorted, indices] = sort(row, 'descend');


%plotIm(W(:,indices(1:10)))


plotIm2(W(:,indices(1:10)));

nImages =256;
edgeStorgae = nan(32, 32, 256);
for i=1:256
    wsingle = reshape(W(:,indices(i)),32,32);
    edgeStorage(:,:,i) = edge(wsingle(32:-1:1,:),'Sobel',0.04);
end

colormap(winter(200))
filterImage = zeros(32,32);
for i=256:-1:1
    filterImage(edgeStorage(:,:,i)) = 257 -i;
end

figure
filterImage2 = zeros(32,32);
filterImage2(edgeStorage(:,:,1)) = 10;
filterImage2(edgeStorage(:,:,3)) = 9;
filterImage2(edgeStorage(:,:,20)) = 8;
filterImage2(edgeStorage(:,:,40)) = 7;
filterImage2(edgeStorage(:,:,70)) = 6;
filterImage2(edgeStorage(:,:,100)) = 5;
filterImage2(edgeStorage(:,:,150)) = 4;
filterImage2(edgeStorage(:,:,200)) = 3;
filterImage2(edgeStorage(:,:,210)) = 2;
filterImage2(edgeStorage(:,:,255)) = 1;
colormap(hot(11))
image(10-filterImage2,'CDataMapping','scaled')
caxis([0 10])
colormap(hot(11))
