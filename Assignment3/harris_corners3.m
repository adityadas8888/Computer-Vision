function [pts] = extract_corners(image,THRES )

G = rgb2gray(image);

G2 = im2double(G);

[Gx,Gy] = imgradientxy(G2);
Ix = Gx;
Iy = Gy;
f = fspecial('gaussian');
Ix2 = imfilter(Ix.^2, f);
Iy2 = imfilter(Iy.^2, f);
Ixy = imfilter(Ix.*Iy, f);
%THRES = 0.06;
num_rows = size(image,1);
num_cols = size(image,2);
H = zeros(num_rows, num_cols);
for y = 6:size(image,1)-6
    for x = 6:size(image,2)-6
        Ix2_matrix = Ix2(y-2:y+2,x-2:x+2);
        Ix2_mean = mean(Ix2_matrix(:));
        Iy2_matrix = Iy2(y-2:y+2,x-2:x+2);
        Iy2_mean = mean(Iy2_matrix(:));
        Ixy_matrix = Ixy(y-2:y+2,x-2:x+2);
        Ixy_mean = mean(Ixy_matrix(:));
  
        Matrix = [Ix2_mean, Ixy_mean; 
                  Ixy_mean, Iy2_mean];
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