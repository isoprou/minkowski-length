%Proposition 3.8 Finds all 3-point Q that can appear together with T_0 in a 
%maximal decomposition

%Part 1: Let Q=[0,0,0;0,0,1;a,b,-1] where |a|, |b|<=11. Here we check that 
% we can have T_0+Q=2 only for |a|,|b|<=3.
P=[1,0,0;0,1,0;-1,-1,0];
Q=[0,0,0;0,0,1;0,0,0];
for a=-11:11
    for b=-11:11
        Q(3,:)=[a,b,-1];
        if minktwo(minksum(P,Q))
            [a,b]
        end
    end
end

%Part 2: Let  Q=[0,0,0;1,0,0;a,b,c] where 0<=a,b<c<=2. Here we check that 
% we can have T_0+Q=2 only for a=b=0 and c=1.

P=[1,0,0;0,1,0;-1,-1,0];
Q=[0,0,0;1,0,0;0,0,0];

for c=1:2
    for b=0:c-1
        for a=0:c-1
         Q(3,:)=[a,b,c];
            if minktwo(minksum(P,Q))
              [a, b, c]
            end
        end
        
    end
end

%Repeat the same calculation for Q=[0,0,0;0,1,0;a,b,c], get a=b=0 and c=1.

P=[1,0,0;0,1,0;-1,-1,0];
Q=[0,0,0;0,1,0;0,0,0];

for c=1:2
    for b=0:c-1
        for a=0:c-1
         Q(3,:)=[a,b,c];
            if minktwo(minksum(P,Q))
              [a, b, c]
            end
        end
        
    end
end 

%Now Q=[0,0,0;1,1,0;a,b,c], get a=b=0 and c=1, so Q=[0,0,0;1,1,0;0,0,1]
%(Note that alternatively we can write Q=[0,0,0;-1,-1,0;0,0,1])

P=[1,0,0;0,1,0;-1,-1,0];
Q=[0,0,0;1,1,0;0,0,0];

for c=1:2
    for b=0:c-1
        for a=0:c-1
         Q(3,:)=[a,b,c];
            if minktwo(minksum(P,Q))
              [a, b, c]
            end
        end
        
    end
end 

P=[1,0,0;0,1,0;-1,-1,0];
Q=[0,0,0;1,1,0;0,0,0];



