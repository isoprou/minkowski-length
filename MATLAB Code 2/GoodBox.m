% The input is a lattice polytope P.  Consider a primitive lattice segment I with direction vector (p,q,r).
% This function returns values x,y,z such that each segment I with L(P+I)=2 satisfies |p|<=x, |q|<=y, and |r|<=z. 

% Given a lattice polyhedron P calculates values x,y,z such that any
% segments I that can be in a maximal decomposition with P will have absolute
% values of the direction vector components bounded by x,y,z

function [x,y,z]=GoodBox(P)

[PTS,EQS]=LP(P);

s=size(EQS);
s=s(1,1);
x=0;
y=0;
z=0;

signs=[1,1,1,1;1,1,-1,-1;1,-1,1,-1];
% Loops through triples of the equations of planes determined by the faces
% of P to find their intersection points to determine bounds of our box
for i=1:s
    for j=i+1:s
        for k=j+1:s
            M=[EQS(i,1:3); EQS(j,1:3); EQS(k,1:3)]; 
            if not(det(M)==0)
                x0=0;
                y0=0;
                z0=0;
                for S=signs
                    PT=inv(M)*(S.'.*[14;14;14]);
                    x0=max(x0,abs(PT(1)));
                    y0=max(y0,abs(PT(2)));
                    z0=max(z0,abs(PT(3)));
                end
                if x>0
                    x=min(x,x0);
                else
                    x=x0;
                end
                if y>0
                    y=min(y,y0);
                else
                    y=y0;
                end
                if z>0
                    z=min(z,z0);
                else
                    z=z0;
                end
            end
        end
    end
end
x=ceil(x);
y=ceil(y);
z=ceil(z);
