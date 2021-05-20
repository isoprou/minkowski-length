 %Lemma 3.1 Part 1: Let P be the standard unit simplex in the (x,y) plane. 
 %Here we check that for segments I with the primitive direction vector (p,q,r), 
 %where 0\leq p\leq q\leq r\leq 43 and L(P+I)=2 we have r\leq 14.
 P=[0,0,0;1,0,0;0,1,0];
 Q=[0,0,0;0,0,1];
 for r=1:43
     for q=0:r
         for p=0:q
             if gcd(p,gcd(q,r))==1
               Q=[0,0,0;p,q,r];
                  if minktwo(minksum(P,Q)) 
                  r
                  end;
             end;
         end;
     end;
 end;
 
 %Lemma 3.1 Part 2: Let P be the standard T_0=conv{(1,0,0), (0,1,0),(-1,-1,0)} 
 % in the (x,y)-plane. Here we check that for segments I with the primitive 
 %direction vector (p,q,r) where 0\leq p\leq q\leq r\leq 14 and L(P+I)=2 we 
 %have r\leq 2.

 P=[1,0,0;0,1,0;-1,-1,0];
 for r=1:14
     for q=0:r
         for p=0:q
             if gcd(p,gcd(q,r))==1
               Q=[0,0,0;p,q,r];
                  if minktwo(minksum(P,Q)) 
                  r
                  end;
             end;
         end;
     end;
 end;
 