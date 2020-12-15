img1=imread('viewL.png');
img2=imread('viewR.png');
img1=rgb2gray(img1);
img2=rgb2gray(img2);
val=window(img2,3,1,1);
val=double(val)
t=sum((double(img1(1,1))-val).^2)
sum((val-double(img1(1,1))).^2)
sz = size(img2);
new_mat1= zeros(sz);
 for i=1:370
        for j=1:463
            new_mat1(i,j)=CC(img1,img2,i,j);
%             new_mat1(i,j)=SSD(img1,img2,i,j)
        end
 end
 figure,
disparityRange = [0 64];
imshow(new_mat1,disparityRange);
title('Disparity Map');
colormap(gca,jet) 
colorbar
figure,
imshow(new_mat1)

function qq=SSD(img1,img2,a,b)
    ss=window(img1,7,a,b);
    ss=double(ss);
    new_mat= zeros(1,463);
    new_mat=new_mat+100000000;

    if b-75>0
        lim1=b-75;
    else 
       lim1=1;
    end
        for j=lim1:b
            val=window(img2,7,a,j);
            val=double(val);
            new_mat(j)=sum((ss-val).^2);
        end 
    [m,index]=min(new_mat);
    qq=b-index;
end

function qq1=CC(img1,img2,a,b)
    ss=window(img1,7,a,b);
    ss=double(ss);
    new_mat= zeros(1,463);
    new_mat=new_mat+000;
    
    if b-75>0
        lim1=b-75;
    else 
       lim1=1;
    end
        for j=lim1:b
            val=window(img2,7,a,j);
            val=double(val);
            val11 = reshape(ss,[7,7]);
            val22 = reshape(val,[7,7]);
            tmp1 = sum(val11.*val22 , 'all');
            tmp2 =sum(val22.*val22 , 'all');
            tmp3 = sum(val11.*val11 , 'all');     
            tmp1/sqrt(tmp2*tmp3);            
            new_mat(j)=tmp1/sqrt(tmp2*tmp3);
        end 
    [m,index]=max(new_mat);
    [m,index,b];
    qq1=b-index;
end
    
    
function q=window(img,size,a, b)
    p=[];
    size=(size+1)/2;
    for i=-size+1:size-1
        for j=-size+1:size-1
            if i+a<=0 || i+a>=370 || j+b<=0 || j+b>=463
                p=[p,0];
            else 
                p=[p,img(i+a,j+b)];
            end    
        end
    end
    q=p;
end