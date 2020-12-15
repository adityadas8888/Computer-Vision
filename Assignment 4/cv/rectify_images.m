function [rectL,rectR] =rectify_images(imgL,imgR,Pl,Pr)
id=1;
jd=1;
%factorize Projective matrixes
[A1,R1,t1] = art(Pl);
[A2,R2,t2] = art(Pr);

A1=absdiag(A1);
A2=absdiag(A2);
A1(1,2)=0;
A2(1,2)=0;
temp1 = [0 0 0];
temp2 = [0 0 0];

%finding new axes
x = (t1-t2)/2;
y = cross(R1(3,:)',x);
z = cross(x,y);

%finding the rotational matrix
Rect = [x'/norm(x)
   y'/norm(y)
   z'/norm(z)];
Rl=Rect;
Rr=R2*Rect;


H1=A1*Rect*inv(A1);
H2=A2*Rr*inv(A2);
imgL=imresize(imgL,0.6);
imgR=imresize(imgR,0.6);
[r,c]=size(imgL);
rectL=zeros(r,c);
rectR=zeros(r,c);

for i=1:r
    for j=1:c
     temp1=H1*[i,j,1]';
     temp1=abs(round(temp1./temp1(3)));
     id=temp1(1);
     jd=temp1(2);
      rectL(id,jd)=imgL(i,j);
      recTR(id,jd)=imgR(i,j);
    end   
 end
rectL=rectL';
rectR=rectR';
end

function [A,R,t] = art(P)
Q = inv(P(1:3, 1:3));
[U,B] = qr(Q);
R = inv(U);
t = B*P(1:3,4);
A = inv(B);
A = A ./A(3,3);
end
