%Proposition 3.19 Here R=[1,0,0;0,1,0;1,1,2;-1,-1,-1;a,b,c], where
%|a|<=3, |b|<=3, |c|<=5 and [a,b,c]\neq [1,0,0], [0,1,0], [1,1,2], 
%[-1,-1,-1]. We check that there is no Q with |Q|=3 such that L(P+Q)=3

R=[1,0,0;0,1,0;1,1,2;-1,-1,-1;0,0,0];
 
for a=-3:3 
    for b=-3:3 
        for c=-5:5  
            R(5,:)=[a,b,c];
             if minkone(R) 
                 [x,y,z]=GoodBox(R);
                 if AddTriangleHuh(R,x,y,z)
                  [a,b,c]
                 end    
             end
         end
    end
end 
