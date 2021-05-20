%Checks to see if L(Conv(X))<3
function [x] = minktwo(X)
x=true;
PTS=LP(X);
s=size(PTS);
p=s(1,1);
segs=findsegs(PTS);
j=1;
segstwo=zeros(1,3);
if p>27
    x=false;
else
%Finds all of the segments of even length
for i=1:p*(p-1)/2
    if isequal(mod(segs(i,:),2),zeros(1,3))
        segstwo(j,:)=segs(i,:);
        j=j+1;
    end
end
s=size(segstwo);
l=s(1,1);
%Tests if any of the segments of even lengths are parallel.
for i=1:l
    for j=i+1:l
        if isequal(segstwo(i,:),segstwo(j,:)) || ...
           isequal(segstwo(i,:), -segstwo(j,:))
           x=false;
        end
    end
end
%Checks if there are any sums of 3 distince primitive segments in Conv(X)
while p > 6 && x
    for i=2:p-2
        for j=i+1:p-1
            for k=j+1:p
                PT=PTS(1,:);
                Vi=PTS(i,:)-PT;
                Vj=PTS(j,:)-PT;
                Vk=PTS(k,:)-PT;
                if ismember(PT+Vi+Vj,PTS,'rows') && ...
                   ismember(PT+Vi+Vk,PTS,'rows') && ...
                   ismember(PT+Vj+Vk,PTS,'rows') && ...
                   ismember(PT+Vi+Vj+Vk,PTS,'rows')
                   x=false;
                end
            end
        end
    end
    PTS=PTS(2:p,:);
    p=p-1;
end             
end
end