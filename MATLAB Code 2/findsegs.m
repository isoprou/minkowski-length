%Calculates all of the segments from a set of points
function [segs]=findsegs(X)
n=length(X);
segs=zeros(n*(n-1)/2,3);
k=1;
for i=1:n-1
    for j=i+1:n
        segs(k,:)=X(i,:)-X(j,:);
        k=k+1;
    end
end