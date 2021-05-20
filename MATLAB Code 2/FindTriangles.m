%Finds all triangles that can be in a maximal decomposition with P if the
%segments in the triangles are required to have absolute values at most 
%x,y,z 

function [GoodTriangles] = FindTriangles(P,x,y,z)

Q=zeros(3,3);
GoodTriangles=zeros(3,3,0);
n=0;
Segments=FindSegments(P,x,y,z);
s=size(Segments);
l=s(1,1);
for i=1:l
    Q(2,:)=Segments(i,:);
    for j=i+1:l
        Seg3=Segments(j,:)-Segments(i,:);
        if ismember(Seg3,Segments,'rows')
            Q(3,:)=Segments(j,:);
            if minktwo(minksum(P,Q))
                n=n+1;
                GoodTriangles(:,:,n)=Q;
            end
        end
    end
end
        
