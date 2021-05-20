%Takes in a set of points X in R^3 as a n x 3 matrix, and outputs the 
%lattice points in Conv(X) as PTS and the equations that define Conv(X)
 
function [PTS,EQS]=LP(X)
 
int=mean(X);% finds an interior point of the Conv(X)
Y=convhull(X, 'simplify', true);% creates a matrix saying which points 
                                % of X form faces of the Conv(X)
m=length(Y);                                
EQS=zeros(m,4);
% Calculates the inequations of the halfspaces and puts them into a matrix,
% they are of the form ax+by+cz>=d
for i=1:m
   Norm = cross((X(Y(i,1),:)-X(Y(i,2),:)),(X(Y(i,1),:)-X(Y(i,3),:)));
   if Norm*int' < Norm*(X(Y(i,1),:))'
      Norm = -Norm;
   end
   GrCD=abs(gcd(gcd(Norm(1),Norm(2)),Norm(3)));
   if GrCD~=1
       Norm = Norm./GrCD;
   end
        EQS(i,1:3)=Norm;
        EQS(i,4)=Norm*(X(Y(i,1),:))';
end

%Tests all of the points in a rectangular prism containing the points of X
%to see whether they satisfy the system of linear inequalities.
n=1;
for x=min(X(:,1)):max(X(:,1))
   for y=min(X(:,2)):max(X(:,2))
       for z=min(X(:,3)):max(X(:,3))
           if (EQS(:,1:3)*[x y z]' >= EQS(:,4)) == ones(m,1)
               PTS(n,:)=[x y z];
               n=n+1;
           end
       end
    end
end
end