function [val] = siftCV(image1,image2)
[x1,y1] = vl_sift(single(rgb2gray(image1)));
[x2,y2] = vl_sift(single(rgb2gray(image2)));
[matches, score] = vl_ubcmatch (y1, y2);

M1 = [x1(1, matches(1, :)); x1(2, matches(1, :)); ones(1, length(matches))];
M2 = [x2(1, matches(2, :)); x2(2, matches(2, :)); ones(1, length(matches))];

showMatchedFeatures(image1,image2,[M1(1:2, :)]',[M2(1:2, :)]','montage','PlotOptions',{'ro','g+','b-'} );
val=0;
end
