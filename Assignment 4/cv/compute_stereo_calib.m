function [Kl,Tl,Kr,Tr] = compute_stereo_calib(P,pl,pr)

Pl_aug=[];
Pr_aug=[];

%calculate Camera matrix using the least squares method

Pl = compute_cam(P,pl);     %received the left projective matrix
Pr = compute_cam(P,pr);     %received the right projective matrix

[Kl, Rl, Tl] = art(Pl);
[Kr, Rr, Tr] = art(Pr);

disp('Intrinsic matrix for left image')
Kl=absdiag(Kl)

disp('Intrinsic matrix for right image')
Kr=absdiag(Kr)

disp('Extrinsic properties for left image')
extL=[Rl Tl]

disp('Extrinsic properties for right image')
extR=[Rr Tr]

end

    function [A,R,t] = art(P)
  % ART: factorize a PPM as  P=A*[R;t]
  Q = inv(P(1:3, 1:3));
  [U,B] = qr(Q);
  
  R = inv(U);
  t = B*P(1:3,4);
  A = inv(B);
  A = A ./A(3,3);

    end

 function [R Q] = rq(M)
    [Q,R] = qr(flipud(M)')
    R = flipud(R');
    R = fliplr(R);

    Q = Q';   
    Q = flipud(Q);
 end