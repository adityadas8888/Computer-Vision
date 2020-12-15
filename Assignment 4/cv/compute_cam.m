function [Pl] = compute_cam(P,pl)
A=[];
for i=1:length(P)
    world = P(i,:);
    Z = [0,0,0,0];
    x1 = -pl(i,1);      %-x
    y1 = -pl(i,2);      %-y 
    right1 = x1*world;  %-x*[XYZ]
    right2 = y1*world;   %-y*[XYZ]
    temp1 = [world,1,Z,right1,x1];
    temp2 = [Z,world,1,right2,y1]; 
    tempmat = [temp1;temp2];
    A=[A;tempmat];
end
[U,S,V] = svd(A);
    h=double(V(:,12)/V(12,12));
    H=reshape(h,4,3);
    Pl=H.';
    
end

