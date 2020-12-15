function [null] = Problem2()
 %Problem 2
 % (a)
 I = imread('board.tif');
 imshow(I); axis on;
 I2 = I(90:180, 200:300, :);
 figure,imshow(I2(:,:,:,1)); axis on;
 %(b)
 % nested for loop NTSC method
tic
[row,col,rgb] = size(I);
min=255;
max=0;
 for r = 1:row 
	for c = 1:col 
	gray_image(r,c,:) = 0.2989 * I(r,c,1) + 0.5870 * I(r,c,2) +0.1140 * I(r,c,3); 
	if (gray_image(r,c,:)>max)
		max=gray_image(r,c,:);
	elseif (gray_image(r,c,:)<min)
		min=gray_image(r,c,:);
	end	
 	
	end
end 
toc
figure,imshow(gray_image(:,:,:,1)); axis on;
gray_mean=double(max+min)/2;


% nested for loop RGB average method

tic
for r = 1:row 
	for c = 1:col 
	gray_image(r,c,:) = (I(r,c,1) + I(r,c,2) + I(r,c,3)/3); 
	if (gray_image(r,c,:)>max)
		max=gray_image(r,c,:);
	elseif (gray_image(r,c,:)<min)
		min=gray_image(r,c,:);
	end	
 	
	end
end 
toc
figure,imshow(gray_image(:,:,:,1)); axis on;

% MATLAB matrix operation NTSC
tic
 R=I(:,:,1);
 G=I(:,:,2);
 B=I(:,:,3);
 gray=0.2989*R+0.5870*B+0.1140*G;
toc 
figure,imshow(gray(:,:,:,1)); axis on;

% MATLAB matrix operation RGB pixel average
tic
 R=I(:,:,1);
 G=I(:,:,2);
 B=I(:,:,3);
 gray=(R+B+G)/3;
toc 
figure,imshow(gray(:,:,:,1)); axis on;
 %Built-in-image processing
tic
 built_grey=rgb2gray(I);
   imshow(built_grey);
toc
%(c)
 % nested for loop
tic 
for r = 1:row 
	for c = 1:col 
	if (gray_image(r,c,:)>gray_mean)
		bin_image(r,c,:)=1;
	else
		bin_image(r,c,:)=0;
	end	
 	
	end
end 
toc
figure(7)
subplot(2,2,1),imshow(gray_image);
subplot(2,2,2),imshow(bin_image);

% MATLAB Matrix Operation
tic
gray_image=rgb2gray(I);
BIN=gray_image;
temp=mod(gray_image,gray_mean);
temp=temp/gray_mean ;
final=temp*255;
figure(8)
subplot(2,2,1),imshow(gray_image);
subplot(2,2,2),imshow(final);
toc
% Built-in-image processing
tic
built_bin=im2bw(I);
figure(9)
subplot(2,2,1),imshow(gray_image);
subplot(2,2,2),imshow(built_bin);
toc
% (d) Smoothening an image using conv2
tic
A=ones(7);
A=A/49;
smooth=conv2(double(A),double(rgb2gray(I)));
figure(10)
subplot(2,2,1),imshow(gray_image);
subplot(2,2,2),imshow(uint8(smooth));
toc
%(d) Smoothening an image using nested for loops
tic
I=imread('board.tif');
I=rgb2gray(I);
[row,col,rgb]=size(I);
convo= zeros(row+6, col+6);
[x,y] = size(convo);
window = double(ones(7,7));
window=window/50;
for r = 1:x
    for c = 1:y
    average = 0;
        for fr = r-3:r+3
        if fr <= row && fr > 0
        for fc = c-3:c+3
        if fc <= col && fc > 0 
        average = average + window(r-fr+4,c-fc+4)*(I(fr,fc)); 
        end
        end
        end
        end  
        convo(r,c) = average;
    end
end
figure(11);
 imshow(uint8(convo(3:row-3,3:col-3)));
toc
end

