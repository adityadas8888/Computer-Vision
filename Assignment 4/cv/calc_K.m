function [Pl_aug_new,Rot] = calc_K(Pl_aug)
% 
% normalval=sqrt(double(Pl_aug(3,1)^2)+double(Pl_aug(3,2)^2)+double(Pl_aug(3,3)^2));
% Pl_aug=Pl_aug/normalval;
%make theta first

thetaleft =atan(Pl_aug(3,1)/Pl_aug(3,2));                   %theta=P(31)/P(32)

%make Z theta rotation matrix
Rot_left_theta=[cos(thetaleft),sin(thetaleft),0;-sin(thetaleft),cos(thetaleft),0;0,0,1];

%make the new augmented rotation matrix using theta
Pl_aug=Pl_aug*Rot_left_theta;           %P=P*Rtheta                  



%make the new beta angle
betaleft =atan(Pl_aug(3,2)/Pl_aug(3,3));            %beta=P(32)/P(33)

%make X beta rotation matrix
Rot_left_beta=[1,0,0;0,cos(betaleft),sin(betaleft);0,-sin(betaleft),cos(betaleft)];

%make the new augmented rotation matrix using beta

Pl_aug=Pl_aug*Rot_left_beta;                    %P=P*Rbeta

%make the new gamma angle
gammaleft =atan(Pl_aug(2,1)/Pl_aug(2,2));       %Gamma=P(21)/P(22)

%make the X gamma rotation matrix
Rot_left_gamma=[1,0,0;0,cos(gammaleft),sin(gammaleft);0,-sin(gammaleft),cos(gammaleft)];
%Rot_left_gamma=[cos(gammaleft),sin(gammaleft),0;-sin(gammaleft),cos(gammaleft),0;0,0,1];

%make the new augmented rotation matrix using gamma
Pl_aug_new=Pl_aug*Rot_left_gamma;

%making just the rotation matrix.
Rot = Rot_left_theta*Rot_left_beta*Rot_left_gamma;

end

