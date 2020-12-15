function H = est_homography(mpts1,mpts2)
X=mpts1(:,1);
Y=mpts1(:,2);
x=mpts2(:,1);
y=mpts2(:,2);


A = zeros(length(x(:))*2,9);

for i = 1:length(x(:))
 a = [x(i),y(i),1];
 b = [0 0 0];
 c = [X(i);Y(i)];
 d = -c*a;
 A((i-1)*2+1:(i-1)*2+2,1:9) = [[a b;b a] d];
end

[U,S,V] = svd(A);
h=double(V(:,9)/V(9,9));
H = reshape(h,3,3)';