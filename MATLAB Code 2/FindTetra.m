%Finds all polytopes that are the convex hull of 4 points that can be in a 
%maximal decomposition with P and the segments in the polytope are required
%to have absolute values at most x,y,z 

function [GoodTetra] = FindTetra(P,x,y,z)


% Finds all possible segments that could appear in the 4+ point polyhedra
Segments=FindSegments(P,x,y,z);

GoodTetra=zeros(4,3,0);
n=0;
s=size(Segments);
l=s(1,1);

% Takes two segments checks if the third segment they form can be added to
% P, then checks if that triangle can be added.  If it can, then adds
% another segment, checks the 3 other added segments, and then finally 
% checks the whole "tetrahedron"(it could be degenerate).

for i=1:l    
    Q=zeros(4,3);
    Q(2,:)=Segments(i,:);
    for j=i+1:l
        Seg3=Segments(j,:)-Segments(i,:);
        if ismember(Seg3,Segments,'rows')
            Q(3,:)=Segments(j,:);
            if minktwo(minksum(P,Q))
                for k=j+1:l
                    Seg5=Segments(k,:)-Segments(i,:);
                    Seg6=Segments(k,:)-Segments(j,:);
                    if ismember(Seg5,Segments,'rows') && ismember(Seg6,Segments,'rows')
                        Q(4,:)=Segments(k,:);
                        if minktwo(minksum(P,Q))
                            n=n+1;
                            GoodTetra(:,:,n)=Q;
                        end
                    end
                end
            end
        end
    end
end