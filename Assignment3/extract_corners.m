function [pts] = extract_corners(image,THRES )
G=padarray(image,[5,5],'both');
G = rgb2gray(G);
G2 = im2double(G);

[Gx,Gy] = imgradientxy(G2);
Ix = Gx;
Iy = Gy;
f = fspecial('gaussian');
Gx2 = imfilter(Ix.^2, f);
Gy2 = imfilter(Iy.^2, f);
Gxy = imfilter(Ix.*Iy, f);
%THRES = 0.06;
num_rows = size(image,1);
num_cols = size(image,2);
H = zeros(num_rows, num_cols);
for y = 6:size(image,1)-6
    for x = 6:size(image,2)-6
        Gx2_matrix = Gx2(y-2:y+2,x-2:x+2);
        Gx2_mean = mean(Gx2_matrix(:));
        Gy2_matrix = Gy2(y-2:y+2,x-2:x+2);
        Gy2_mean = mean(Gy2_matrix(:));
        Gxy_matrix = Gxy(y-2:y+2,x-2:x+2);
        Gxy_mean = mean(Gxy_matrix(:));
  
        Matrix = [Gx2_mean, Gxy_mean; 
                  Gxy_mean, Gy2_mean];
        R1 = det(Matrix) - (THRES * trace(Matrix)^2);
        H(y,x) = R1;
       
    end
end
avg_r = mean(mean(H));
threshold = abs(5 * avg_r);
[row, col] = find(H > threshold);
scores = [];
for index = 1:size(row,1)
    r = row(index);
    c = col(index);
    scores = cat(2, scores,H(r,c));
end

y = row;
x = col;
pts=x;
pts(:,2)=y;

end
%keep threshold between 0.2 to 0.22
% [pts] = extract_corners(mall1,0.21 );
%img=padarray(mall1,[5,5],'both');
% figure; imshow(img) 
% hold on
% for i = 1:size(pts,1)
%     plot(pts(i,1), pts(i,2), 'ro', 'MarkerSize', 3); 
% end
