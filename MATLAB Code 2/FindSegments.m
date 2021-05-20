%Finds all segments that can be in a maximal decomposition with P if the
%segments are required to have absolute values at most x,y,z 


function [GoodSegments] = FindSegments(P,x,y,z)
Q=[0,0,0;0,0,0];
GoodSegments=zeros(0,3);
for i=0:x
    for j=-y:y
        for k=-z:z
            if gcd(i,gcd(j,k))==1
             Q(2,1:3)=[i,j,k];
             if minktwo(minksum(P,Q))
                if i+abs(j)+abs(k)>0
                    GoodSegments=[GoodSegments;i,j,k];
                end
             end
            end
         end
    end
end