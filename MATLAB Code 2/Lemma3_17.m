%Lemma 3.17 Let P=[0,0,0;1,0,0;0,1,0;a,b,c] where 0<=a<=b<=c<=20 and c>=6.
%For each such P we show that there is no Q with |Q|=3 and L(P+Q)=2.
P=[0,0,0;1,0,0;0,1,0;0,0,0];
for c=6:20
    for b=0:c
        for a=0:b 
              if gcd(a,gcd(b,c))==1 & gcd(a-1,gcd(b,c))==1 & gcd(a,gcd(b-1,c))==1
               P(4,:)=[a,b,c];
               [x,y,z]=GoodBox(P);
                 if AddTriangleHuh(P,x,y,z)
                  [a,b,c]
                 end
              end
         end
    end
end    
