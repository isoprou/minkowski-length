%Finds all polyhedra containing at least 4 points that can be in a maximal 
%decomposition with P if P has length 2 and the segments in the polyhedra
%are required to have absolute values at most x,y,z 


function [GoodTetra] = FindTetra2(P,x,y,z)



% Finds all possible segments that could appear in the 4+ point polyhedra
Segments=FindSegments2(P,x,y,z);

GoodTetra=zeros(4,3,0);
n=0;
s=size(Segments);
l=s(1,1);

% Takes two segments checks if the third segment they form can be added to
% P, then checks if that triangle can be added.  If it can, then adds
% another segment, checks the 3 other added segments, and then finally 
% checks the whole "tetrahedron"(it could be degenerate).  Once one is
% found, breaks the loops
for i=1:l    
    Q=zeros(4,3);
    Q(2,:)=Segments(i,:);
    for j=i+1:l
        Seg3=Segments(j,:)-Segments(i,:);
        if ismember(Seg3,Segments,'rows')
            Q(3,:)=Segments(j,:);
            if minkthree(minksum(P,Q))
                for k=j+1:l
                    Seg5=Segments(k,:)-Segments(i,:);
                    Seg6=Segments(k,:)-Segments(j,:);
                    if ismember(Seg5,Segments,'rows') && ismember(Seg6,Segments,'rows')
                        Q(4,:)=Segments(k,:);
                        if minkthree(minksum(P,Q))
                            n=n+1;
                            GoodTetra(:,:,n)=Q;
                        end
                    end
                end
            end
        end
    end
end