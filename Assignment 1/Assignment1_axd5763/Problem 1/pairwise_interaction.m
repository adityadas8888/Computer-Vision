function [M] = pairwise_interaction(A,B)
%First pair of Lines
syms x y z;
T=zeros(1,3);
S=zeros(1,3);
[row,column]=size(T);
while(row<=3) 
randx=mod(randi(29),3);
randy=mod(randi(67),15);
randz=mod(randi(56),5);
if(A(3))
	z=(-A(4)-A(2)-A(1))/A(3);
	if(row<=3)
    		C=[randx*A(1),randy*A(2),z*A(3)];
    		T=[T;C];
    		[row,column]=size(T);
	end

elseif(A(3)==0)
	if(A(1)==0)
		y=-A(4);
		C=[randx,y,randz];
    		T=[T;C];
    		[row,column]=size(T);
	elseif(A(2)==0)
		x=-A(4);
		C=[x,randy,randz];
    		T=[T;C];
    		[row,column]=size(T);
	end	
end
end	
[row,column]=size(S);
while(row<=3) 
randx=mod(randi(20),3);
randy=mod(randi(37),15);
randz=mod(randi(16),5);
if(B(3))
	z=(-B(4)-B(2)-B(1))/B(3);
	if(z~=0&&row<=3)
    		C=[randx*B(1),randy*B(2),z*B(3)];
    		S=[S;C];
    		[row,column]=size(S);
	end

elseif(B(3)==0)
	if(B(1)==0)
		y=-B(4);
		C=[randx,y,randz];
    		S=[S;C];
    		[row,column]=size(S);
	elseif(B(2)==0)
		x=-B(4);
		C=[x,randy,randz];
    		S=[S;C];
    		[row,column]=size(S);
	end	
end
end
R1 = find_intersection([T(4),T(5),T(6)],[T(7),T(8),T(9)],[S(4),S(5),S(6)],[S(7),S(8),S(9)]);
	
end


