% Checks if P can be in a maximal decomposition with a lattice polytope 
% with at least 4 lattice points and whose segments have absolute value
% bounded by x,y,z



function [Answer] = AddTetraHuh(P,x,y,z)


Answer=0;

%Finds all possible segments that could appear in the triangle
Segments=FindSegments(P,x,y,z);

s=size(Segments);
l=s(1,1);

%Takes two segments checks if the third segment they form can be added to
%P, then checks if that triangle can be added.  If it can, then adds
%another segment, checks the 3 other added segments, and then finally 
%checks the whole "tetrahedron"(it could be degenerate).  Once one is
%found, breaks the loops
for i=1:l
    if Answer==1
        break
    end    
    Q=zeros(4,3);
    Q(2,:)=Segments(i,:);
    for j=i+1:l
        if Answer==1
            break
        end
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
                            Answer=1;
                            break
                        end
                    end
                end
            end
        end
    end
end