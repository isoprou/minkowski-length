 %Lemma 3.2 Part 1: Here we rule out the case a+b>28. Under this
 %assumption we showed that the direction vector (x,y,z) of a primitive
 %segment I satisfies z=0, x\geq 0, y\geq 0, x,y\leq 14. Due to symmetry,
 %we can also assume y\leq x. Let P=conv{e1,e2,e3}. We show here that 
 %L(P+I)=2 only happens when (x,y,z)=(1,0,0), (0,1,0), or (1,1,0).
 
 P=[1,0,0;0,1,0;0,0,1];
Q=[0,0,0;0,0,0];
for x=0:14
    for y=0:x
        Q(2,1:3)=[x,y,0];
        if x+y>0
            if gcd(x,y)==1
                if minktwo(minksum(P,Q))
                    [x,y,0]
                end
            end
        end
    end
end
%Here we check for P=[1,0,0;0,1,0;0,0,1;a,b,1], where 0\leq a\leq b and
%a+b\leq 28, whether there exists Q with |Q|=3 or |Q|=4 such that
%L({P+Q)=2. We exclude first cases a=b=1 and a=0, b=1 since they take a bit
%of time (and are not needed for the conclusion of the Lemma). We run them
%separately below.

P=[1,0,0;0,1,0;0,0,1;0,0,0];
for b=2:28
    for a=0:min(b,28-b)
        if a+b>0 && gcd(a,b)==1
            P(4,1:3)=[a,b,1];
            [x,y,z]=GoodBox(P);
            if AddTriangleHuh(P,x,y,z)
                [a,b,3]
                if AddTetraHuh(P,x,y,z)
                    [a,b,4]
                end
            end
        end
    end
end
% Case a=b=1
P=[1,0,0;0,1,0;0,0,1;1,1,1];
[x,y,z]=GoodBox(P);
           if AddTriangleHuh(P,x,y,z)
                [a,b,3]
                if AddTetraHuh(P,x,y,z)
                    [a,b,4]
                end
           end
 
% Case a=0, b=1
P=[1,0,0;0,1,0;0,0,1;0,1,1];
[x,y,z]=GoodBox(P);
           if AddTriangleHuh(P,x,y,z)
                [a,b,3]
                if AddTetraHuh(P,x,y,z)
                    [a,b,4]
                end
           end