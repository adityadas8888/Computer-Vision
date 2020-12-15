function [R1] = find_intersection(P11,P12,P21,P22)
syms Lambda Psi;

A=P12-P11;
B=P21-P22;
C=P21-P11;

eqn1=Lambda*A(1)+Psi*(B(1))==C(1);
eqn2=Lambda*(A(2))+Psi*(B(2))==C(2);
eqn3=Lambda*(A(3))+Psi*(B(3))==C(3);

[A,B] = equationsToMatrix([eqn1, eqn2,eqn3], [Lambda, Psi]);

sol=solve([eqn1,eqn2,eqn3],[Lambda,Psi]);
sol.Lambda;
sol.Psi;
if isempty(sol.Lambda)|| isempty(sol.Psi)
    fprintf('lines meet at infinity')
    projectedP11 = project_point(P11);
    projectedP12 = project_point(P12);
    projectedP21 = project_point(P21);
    projectedP22 = project_point(P22);
    plot3([P11(1),P12(1)],[P11(2),P11(2)],[P11(3),P12(3)],"-O",[P21(1),P22(1)],[P21(2),P22(2)],[P21(3),P22(3)],"-O",[projectedP11(1),projectedP12(1)],[projectedP11(2),projectedP12(2)],[projectedP11(3),projectedP12(3)],'-o',[projectedP21(1),projectedP22(1)],[projectedP21(2),projectedP22(2)],[projectedP21(3),projectedP22(3)],'-o');  
    legend({"L1","L2","PL1","PL2"});
    hold on;
    R1=Inf;
else
    R1 =((1-sol.Lambda)*P11)+(sol.Lambda*P12);
    R2 =(1-sol.Psi)*P21+(sol.Psi*P22);


    if isequal(R1,R2)
        projectedP11 = project_point(P11);
        projectedP12 = project_point(P12);
        projectedP21 = project_point(P21);
        projectedP22 = project_point(P22);
        projectedR1 = project_point(R1);
        plot3([P11(1),P12(1),R1(1)],[P11(2),P11(2),R1(2)],[P11(3),P12(3),R1(3)],"-O",[P21(1),P22(1),R1(1)],[P21(2),P22(2),R1(2)],[P21(3),P22(3),R1(3)],"-O",[projectedP11(1),projectedP12(1),projectedR1(1)],[projectedP11(2),projectedP12(2),projectedR1(2)],[projectedP11(3),projectedP12(3),projectedR1(3)],'-o',[projectedP21(1),projectedP22(1),projectedR1(1)],[projectedP21(2),projectedP22(2),projectedR1(2)],[projectedP21(3),projectedP22(3),projectedR1(3)],'-o');  
        legend({"L1","L2","PL1","PL2"});
        hold on;
    else
        fprintf('lines meet at infinity')
        projectedP11 = project_point(P11);
        projectedP12 = project_point(P12);
        projectedP21 = project_point(P21);
        projectedP22 = project_point(P22);
        plot3([P11(1),P12(1)],[P11(2),P11(2)],[P11(3),P12(3)],"-O",[P21(1),P22(1)],[P21(2),P22(2)],[P21(3),P22(3)],"-O",[projectedP11(1),projectedP12(1)],[projectedP11(2),projectedP12(2)],[projectedP11(3),projectedP12(3)],'-o',[projectedP21(1),projectedP22(1)],[projectedP21(2),projectedP22(2)],[projectedP21(3),projectedP22(3)],'-o');  
        legend({"L1","L2","PL1","PL2"});
        hold on;
    end
end    
end
