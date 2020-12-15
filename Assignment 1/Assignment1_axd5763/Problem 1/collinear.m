function [A] = collinear(R1,R2,R3)
if(R1(1)==Inf&&R1(2)==Inf&&R1(3)==Inf&&R2(1)==InfR2(2)==Inf&&R1(3)==Inf&&R3(1)==Inf&&R3(2)==Inf&&R3(3)==Inf)
    fprintf('the intersection points are collinear on the Infinity Line')
elseif(R1(1)==Inf||R1(2)==Inf||R1(3)==Inf||R2(1)==Inf||R2(2)==Inf||R1(3)==Inf||R3(1)==Inf||R3(2)==Inf||R3(3)==Inf)
    fprintf('The intersection points are not collinear')
else
    Q1=sqrt(((R2(1)-R1(1))^2)+((R2(2)-R1(2))^2)+((R2(3)-R1(3))^2));
    Q2=sqrt(((R3(1)-R1(1))^2)+((R3(2)-R1(2))^2)+((R3(3)-R1(3))^2));
    Q3=sqrt(((R3(1)-R2(1))^2)+((R3(2)-R2(2))^2)+((R3(3)-R2(3))^2));
    if(Q1+Q2>Q3 && Q2+Q3>Q1 && Q1+Q3>Q2)
        fprintf('The intersection points are not collinear ')
    else
        fprintf('The intersection points are collinear')
    end

end

end

