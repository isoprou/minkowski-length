%Checks to see if L(Conv(X)==1
function [x]=minkone(X)
X=LP(X);
n=length(X);
x=true;
%Checks if there are more than 8 points in conv(X).
if  n > 8
    x=false;
else
    %Checks if any of the segments in conv(X) are parallel.
    segs=findsegs(X);
    for i=1:n*(n-1)/2
        for j=i+1:n*(n-1)/2
            if isequal(segs(i,:),segs(j,:)) || isequal(segs(i,:), -segs(j,:));
                x=false;
            end
            if x==false 
                break
            end
        end
        if x==false 
            break
        end
    end
end
end
