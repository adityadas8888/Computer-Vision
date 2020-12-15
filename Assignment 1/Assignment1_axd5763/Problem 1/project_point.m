function Q = project_point(P)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Origin=[0,0,0];
Parametric = (P-Origin);
R=Origin+Parametric;
z=1;
Lambda=z/R(3);
R=R*Lambda;
Q=R;
Q
fprintf('is the point of projection')
plot3(R(1),R(2),R(3),'-o');
legend({'point of intersection'});
end

