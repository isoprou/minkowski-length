% Checks if P (of length 2) can be in a maximal decomposition with a triangle whose
% segments have absolute value bounded by x,y,z

function [Answer] = AddTriangleHuh2(P,x,y,z)


Answer=0;
Q=zeros(3,3);

% Finds all possible segments that could appear in the triangle
Segments=FindSegments2(P,x,y,z);
s=size(Segments);
l=s(1,1);

% Loops through pairs of segments that are possible, checks if the third
% segment is also allowable, and then checks if the triangle works, once
% one triangle is found, breaks the loops
for i=1:l
    if Answer==1
        break
    end
    Q(2,:)=Segments(i,:);
    for j=i+1:l
        Seg3=Segments(j,:)-Segments(i,:);
        if ismember(Seg3,Segments,'rows')
            Q(3,:)=Segments(j,:);
            if minkthree(minksum(P,Q))
                Answer=1;
                break
            end
        end
    end
end