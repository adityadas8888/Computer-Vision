function [mpts1,mpts2] = match_corners(img1,img2,pts1,pts2,WSIZE)
x1=pts1(:,1);
y1=pts1(:,2);
x2=pts2(:,1);
y2=pts2(:,2);
mean_sum1=[];
mean_sum2=[];
ncc=[];
ncc1=[];
ncc2=[];
WSIZE=0;
mpts1=[];
mpts2=[];
summer1=0;
summer2=0;
for i = 1:size(pts1,1)
    win1_mat=[img1(x1(i)-1,y1(i)-1),img1(x1(i)-1,y1(i)),img1(x1(i)-1,y1(i)+1);img1(x1(i),y1(i)-1),img1(x1(i),y1(i)),img1(x1(i),y1(i)+1);img1(x1(i)+1,y1(i)-1),img1(x1(i)+1,y1(i)),img1(x1(i)+1,y1(i)+1)];
win1_mean(i)=double(mean(win1_mat(:)));
mean_sum1(i)=(img1(x1(i),y1(i))-win1_mean(i))+summer1;
summer1=mean_sum1(i);
end
for i = 1:size(pts2,1)
    win2_mat=[img2(x2(i)-1,y2(i)-1),img2(x2(i)-1,y2(i)),img2(x2(i)-1,y2(i)+1);img2(x2(i),y2(i)-1),img2(x2(i),y2(i)),img2(x2(i),y2(i)+1);img2(x2(i)+1,y2(i)-1),img2(x2(i)+1,y2(i)),img2(x2(i)+1,y2(i)+1)];
win2_mean(i)=double(mean(win2_mat(:)));
mean_sum2(i)=(img2(x2(i),y2(i))-win2_mean(i))+summer2;
summer2=mean_sum2(i);
end
k=1;
for i = 1:size(pts1,1)
    for j = 1:size(pts2,1)
        ncc(k,1)=x1(i);
        ncc(k,2)=y1(i);
        ncc(k,3)=x2(j);
        ncc(k,4)=y2(j);
        numerator=double(mean_sum1(i)*mean_sum2(j));
        denumerator=double(sqrt(double((summer1^2)*(summer2^2))));
        ncc(k,5)=double(numerator/denumerator);
        k=k+1;
    end
end
ncc1=sortrows(ncc,5,'descend');
k=1;
for i=1:size(ncc,1)
    if(ncc(i,5)>0)
        mpts1(k,1)=ncc(i,1);
        mpts1(k,2)=ncc(i,2);
        mpts2(k,1)=ncc(i,3);
        mpts2(k,2)=ncc(i,4);
        k=k+1;
    end
end    
end

