function [H] = compute(mpts1, mpts2)
A=[];
A1=[];
h=0;
if size(mpts1,1)>4
    for i=1:size(mpts1,1)
        x1=mpts1(i,1);
        y1=mpts1(i,2);
        x2=mpts2(i,1);
        y2=mpts2(i,2);
        A1=[-x1,-y1,1,0,0,0,x1*x2,x2*y1,x2;0,0,0,-x1,-y1,-1,y2*x1,y2*y1,y2];
        A=[A;A1];
    end
    [U,S,V] = svd(A);
    h=double(V(:,9)/V(9,9));
    H=reshape(h,3,3);
    H=H.';
else
    disp('mpts does not have enough elements'); 
    H='null';
end

end

