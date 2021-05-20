%Theorem 3.9
P=[1,0,0;0,1,0;-1,-1,0];
Q=[0,0,0;1,0,0;0,0,1;0,0,0];
for a=-3:3
    for b=-3:3
        Q(4,:)=[a,b,-1];
        if minktwo(minksum(P,Q))
            Q
        end
    end
end
%Note that there are three matrices in the output, but two of them
%     0     0     0  and  0     0     0
%     1     0     0       1     0     0
%     0     0     1       0     0     1
%    -1    -2    -1       1     2    -1
%are equivalent via map 
% 1 -1  0
% 0 -1  0
% 0  0  1
%that maps T_0 to itself.

