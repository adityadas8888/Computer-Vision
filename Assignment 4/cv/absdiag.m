function [P1] = absdiag(P)

P1=[abs(P(1,1)),P(1,2),P(1,3);P(2,1),abs(P(2,2)),P(2,3);P(3,1),P(3,2),abs(P(3,3))];

end

