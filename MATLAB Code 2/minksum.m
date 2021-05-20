%Calculates the Minkowski sum of X and Y
function [PTS] = minksum(X,Y)
s=size(X);
x=s(1,1);
s=size(Y);
y=s(1,1);
PTS=zeros(x*y,3);
n=1;
for i=1:x
    for j=1:y
        PTS(n,:)=X(i,:)+Y(j,:);
        n=n+1;
    end
end        
    