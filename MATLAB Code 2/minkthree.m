%Checks to see if L(Conv(X))<4
function [x] = minkthree(X)
x=true;
y=[0];
PTS=LP(X);
p=length(PTS);
segs=findsegs(PTS);
s=size(segs);
s=s(1,1);
n=1;
m=1;
q=1;
twoind=zeros(s,2);
segsthree=zeros(s,3);

if p > 64
    x=false;
else
    %Finds all of the segments of length 3 and indices of segments of
    %length 2
    for i=1:p
        for j=i+2:p
            if isequal(mod(segs(q,:),3),zeros(1,3))
                segsthree(m,:)=segs(q,:);
                m=m+1;
            elseif isequal(mod(segs(q,:),2),zeros(1,3))
                twoind(n,:)=[i j];
                n=n+1;
            end
            q=q+1;
        end
    end
    m=m-1;
    n=n-1;
    segsthree=segsthree(1:m,:);
    twoind=twoind(1:n,:);
    %Tests if any of the segments of length 3 are parallel.
    for i=1:m
        for j=i+1:m
            if isequal(segsthree(i,:),segsthree(j,:)) || ...
                    isequal(segsthree(i,:), -segsthree(j,:))
                x=false;
            end
        end
    end
    %Tests if any of the segments of length 2 form a parallelogram
    if x
        for i=1:n-1
            t=twoind(i,1);
            PT=PTS(t,:);
            V1=PTS(twoind(i,2),:)-PT;
            for j=i:n
                if t == twoind(j,1) && ismember(V1+twoind(j,2),PTS,'rows')
                    x=false;
                elseif t==twoind(j,2) && ismember(V1+twoind(j,1),PTS,'rows')
                    x=false;
                end
            end
        end
    end
    %Tests if there is the sum 4 segments with one repeat.
    if x
        for i=1:n
            PT=PTS(twoind(i,1),:);
            Vi=PTS(twoind(i,2),:)-PT;
            for j=1:p-1
                Vj=PTS(j,:)-PT;
                for k=j+1:p
                    Vk=PTS(k,:)-PT;
                    if      ~twoind(i,1)==j && ~twoind(j,1)==k && ...
                            ismember(PT+Vi+Vj,PTS,'rows') && ...
                            ismember(PT+Vi+Vk,PTS,'rows') && ...
                            ismember(PT+Vj+Vk,PTS,'rows') && ...
                            ismember(PT+Vi+Vj+Vk,PTS,'rows')
                        x=false;
                    end
                end
            end
        end
    end
    %Checks if there are any sums of 4 distince primitive segments in Conv(X)
    while p > 7 && x
        PT=PTS(1,:);
        for i=2:p-3
            Vi=PTS(i,:)-PT;
            for j=i:p-2
                Vj=PTS(j,:)-PT;
                for k=j:p-1
                    Vk=PTS(k,:)-PT;
                    for m=k:p
                        Vm=PTS(m,:)-PT;
                        if      ismember(PT+Vi+Vj,PTS,'rows') && ...
                                ismember(PT+Vi+Vk,PTS,'rows') && ...
                                ismember(PT+Vi+Vm,PTS,'rows') && ...
                                ismember(PT+Vj+Vk,PTS,'rows') && ...
                                ismember(PT+Vj+Vm,PTS,'rows') && ...
                                ismember(PT+Vk+Vm,PTS,'rows') && ...
                                ismember(PT+Vi+Vj+Vk,PTS,'rows') && ...
                                ismember(PT+Vi+Vj+Vm,PTS,'rows') && ...
                                ismember(PT+Vi+Vk+Vm,PTS,'rows') && ...
                                ismember(PT+Vj+Vk+Vm,PTS,'rows') && ...
                                ismember(PT+Vi+Vj+Vk+Vm,PTS,'rows')
                            x=false;
                        end
                    end
                end
            end
        end
        PTS=PTS(2:p,:);
        p=p-1;
    end
end
end