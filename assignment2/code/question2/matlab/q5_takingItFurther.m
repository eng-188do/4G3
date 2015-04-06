x = imread('stripesb100.png')        ;
imageIns = rgb2gray(x);
imageIns = im2double(imageIns);
imageIns = imageIns(end:-1:1,:);
imageIns = imageIns(:);
imageIns = imageIns';
response = imageIns * R;
sigma200 = aMatrix(200,:) * response'.^2 + bColVector(200);
response = response(200)/sqrt(sigma200);
response
        