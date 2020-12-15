Rotlmean=zeros(3);
Rotrmean=zeros(3);
TranLmean=[];
TranRmean=[];
Pl=[];
Pr=[];
for i=1:12
Rotlmean=Rotlmean+cameraParamsleft.RotationMatrices(:,:,i);
end

for i=1:12
Rotrmean=Rotrmean+cameraParamsright.RotationMatrices(:,:,i);
end
Rotlmean=Rotlmean/12;
Rotrmean=Rotrmean/12;

TranLmean = mean(cameraParamsleft.TranslationVectors)';
TranRmean = mean(cameraParamsright.TranslationVectors)';

Rotr = [Rotrmean TranRmean]; 
Rotl = [Rotlmean TranLmean];

Kl = cameraParamsleft.IntrinsicMatrix'; 
Kr = cameraParamsright.IntrinsicMatrix';
     
Pl=Kl*Rotl;
Pr=Kr*Rotr;

imgL = imread('officeL.png');
imgR = imread('officeR.png');

imL = rgb2gray(imgL);
imR = rgb2gray(imgR);

imL = im2double(imL);
imR = im2double(imR);
[rectL,rectR] = rectify_images(imL,imR,Pl,Pr);
 
 imshow(rectL);
% imshow(rectR);
