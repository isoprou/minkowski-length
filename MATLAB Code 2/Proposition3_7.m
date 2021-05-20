% Proposition 3.7 Checks all possible six point empty lattice polytopes to 
% see if a triangle can be added.
% Empty 6-point polytopes are of the form P=[0,0,0;1,0,0;0,1,0;0,0,1;a,b,1;c,d,1],
% with a,b,c,d>0, c+d>a+b, ad-bc=\pm 1
 
 
 P=[0,0,0;1,0,0;0,1,0;0,0,1;0,0,0;0,0,0];
 
for a=1:5 
    for b=1:5
        P(5,:)=[a,b,1];
        for c=1:5 
            for d=1:5
                if (c+d>a+b) & (a*d-b*a==1 || a*d-b*a==-1)
                    P(6,:)=[c,d,1];
                    s=size(LP(P));
                    s=s(1,1);
                    if s==6 
                     if minkone(P) 
                        [x,y,z]=GoodBox(P);
                        if AddTriangleHuh(P,x,y,z)
                            [a,b,c,d]
                        end
                     end
                    end
                end
            end
        end
    end
end    

