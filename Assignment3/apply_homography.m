function [A, B] = apply_homography(H, a, b)
x1 = [a'; b'; ones(1, length(a))];
y1 = H*x1;
y1 = y1./[y1(3, :); y1(3,:); y1(3, :)];
A = y1(1,:)';
B = y1(2, :)';