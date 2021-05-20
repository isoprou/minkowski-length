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
                    endsi
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
           
           
%Remark 3.3 - not sure if needed
P=[1,0,0;0,1,0;0,0,1;0,1,1];
[x,y,z]=GoodBox(P);
R = FindTriangles(P,x,y,z);
R
           
%Proposition 3.5 For P=S_2 find all tetrahedra Q such that L(P+Q)=2.
S2=[1,0,0;0,1,0;0,0,1;1,1,1];
  [x,y,z]=GoodBox(S2);
  A= FindTetra(S2,x,y,z);
  S=size(A);
  s=S(1,3);
  for i=1:s
      B=zeros(3,3);
      B(1,:)=A(2,:,i)-A(1,:,i);
      B(2,:)=A(3,:,i)-A(1,:,i);
      B(3,:)=A(4,:,i)-A(1,:,i);
      if abs(det(B))==2
          A(:,:,i)
      end
  end
  
  
           
 %Theorem 3.6 
%Finds all possible 4-point Q that can appear in a maximal decomposition
% with P=[0,0,0;1,0,0;0,1,0;0,0,1;1,1,1]

P=[0,0,0;1,0,0;0,1,0;0,0,1;1,1,1];
          [x,y,z]=GoodBox(P);
            R = FindTetra(P,x,y,z);
            R
%The output is R(:,:,1) =

%     0     0     0
%     0    -1     1
%     1    -1     0
%     1     0     1


%R(:,:,2) =

 %    0     0     0
 %    0     1    -1
 %    1     0    -1
 %    1     1     0
 %Both of these are a shift of Q=[1,0,0;0,1,0;0,0,1;1,1,1];
 
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

%Now Q=[0,0,0;1,1,0;a,b,c], get a=b=0 and c=1.

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

%Theorem 3.9
P=[1,0,0;0,1,0;-1,-1,0];
Q=[0,0,0;1,0,0;0,0,1;0,0,0];
for a=-3:3
    for b=-3:3
        Q(4,:)=[a,b,-1];
        if minktwo(minksum(P,Q))
            Q
        end
    end
end
%Note that there are three matrices in the output, but two of them
%     0     0     0  and  0     0     0
%     1     0     0       1     0     0
%     0     0     1       0     0     1
%    -1    -2    -1       1     2    -1
%are equivalent via map 
% 1 -1  0
% 0 -1  0
% 0  0  1
%that maps T_0 to itself.


%Proposition 3.10 Here we find all triangles Q such that L(T_1+Q)=2
   P=[1,0,0;0,1,0;-1,-1,0;0,0,1];
          [x,y,z]=GoodBox(P);
            R = FindTriangles(P,x,y,z);
            R
 %Next we check that there are no 4-point sets Q such that L(T_1+Q)=2
   P=[1,0,0;0,1,0;-1,-1,0;0,0,1];
          [x,y,z]=GoodBox(P);
            R = FindTetra(P,x,y,z);
            
            R 
  %Proposition 3.12 We check that are no triangles Q such that L(T_1=2+Q)=2
   P=[1,0,0;0,1,0;-1,-1,0;2,1,3];
          [x,y,z]=GoodBox(P);
            R = FindTriangles(P,x,y,z);
            R
 
  %Proposition 3.14  Goes through the 8 lattice tetrahedra with one 
  %interior lattice point (Fano tertrahedron) to see if
  % they can have a lattice triangle added to them
  
  
K1=[1,0,0;0,1,0;0,0,1;-1,-1,-1];
[x,y,z]=GoodBox(K1);
AddTriangleHuh(K1,x,y,z)

K2=[1,0,0;0,1,0;1,1,2;-1,-1,-1];
[x,y,z]=GoodBox(K2);
AddTriangleHuh(K2,x,y,z)


K3=[1,0,0;0,1,0;1,-3,5;-2,2,-5];
[x,y,z]=GoodBox(K3);
AddTriangleHuh(K3,x,y,z)


K4=[1,0,0;0,1,0;1,-2,3;-1,1,-2];
[x,y,z]=GoodBox(K4);
AddTriangleHuh(K4,x,y,z)

K5=[1,0,0;0,1,0;-2,1,5;1,-1,-3];
[x,y,z]=GoodBox(K5);
AddTriangleHuh(K5,x,y,z)

K6=[1,0,0;0,1,0;1,-2,5;-1,1,-4];
[x,y,z]=GoodBox(K6);
AddTriangleHuh(K6,x,y,z)

K7=[1,0,0;0,1,0;1,-2,7;-1,1,-5];
[x,y,z]=GoodBox(K7);
AddTriangleHuh(K7,x,y,z)

K8=[1,0,0;0,1,0;-2,2,7;1,-2,-5];
[x,y,z]=GoodBox(K8);
AddTriangleHuh(K8,x,y,z)


%Proposition 3.15
%Now find tetrahedra that one can add to K1, K2

K1=[1,0,0;0,1,0;0,0,1;-1,-1,-1];
[x,y,z]=GoodBox(K1);
FindTetra(K1,x,y,z)

K2=[1,0,0;0,1,0;1,1,2;-1,-1,-1];
[x,y,z]=GoodBox(K2);
FindTetra(K2,x,y,z)



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

 
for c=16:20 
    for b=0:c
        for a=0:b 
              x=14; y=14*gcd(b,c); z=14*gcd(a,c);
              P(4,:)=[a,b,c];
              if minkone(P) &  AddTriangleHuh(P,x,y,z)
                 [a,b,c]
              end
              
         end
    end
end   


%Proposition 3.18 Here R==[1,0,0;0,1,0;0,0,1;-1,-1,-1;a,b,c], where
%|a|<=5, |b|<=5, |c|<=5 and [a,b,c]\neq [1,0,0], [0,1,0], [0,0,1], 
%[-1,-1,-1]. We check that there is no Q with |Q|=3 such that L(P+Q)=3

R=[1,0,0;0,1,0;0,0,1;-1,-1,-1;0,0,0];
 
for a=-5:5 
    for b=-5:5 
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


%Theorem 3.21
K1=[1,0,0;0,1,0;0,0,1;-1,-1,-1];
minktwo(minksum(K1,K1))




%Lemma 4.1  Part 1: Let I_1=[0,0,0;1,0,0], I_2=[0,0,0;,0,1,0], and 
% I_3=[0,0,0;a,b,c] with a<=b<c<=14. Here we find largest c such that  
% L(I_1+I_2+I_3)=3

P=[0,0,0;1,0,0];
Q=[0,0,0;0,1,0];
PQ=minksum(P,Q);
R=zeros(2,3);
maxheight1=0;

for c=1:14
    for b=0:c-1
        for a=0:b
            R(2,:)=[a,b,c];
            if minkthree(minksum(PQ,R))
                maxheight1=c;
            end
        end
    end
end

maxheight1

% Part 2: Let I_1=[0,0,0;1,0,0], I_2=[0,0,0;,1,2,0], and 
% I_3=[0,0,0;a,b,c] with a<=b<c<=14. Here we find largest c such that  
% L(I_1+I_2+I_3)=3

maxheight2=0;
P=[0,0,0;1,0,0];
Q=[0,0,0;1,2,0];
PQ=minksum(P,Q);


for c=1:14
    for b=0:c-1
        for a=1:b
            R(2,:)=[a,b,c];
            if minkthree(minksum(PQ,R))
                maxheight2=c;
            end
        end
    end
end

maxheight2


%Proposition 4.2
%Here first P=T0 and Q=[0,0,0;0,0,1;a,b,-1] For |a|<=3 and |b|<=3 we
%first ensure that there is no lattice triangle R with L(P+Q+R)=3. 

P=[1,0,0;0,1,0;-1,-1,0];
Q=[0,0,0;0,0,1;0,0,0];
for a=-3:3
    for b=-3:3
        Q(3,:)=[a,b,-1];
        PQ=minksum(P,Q);
        if AddTriangleHuh2(PQ,9,9,2)
            Q
        end
    end
end

%Now we still have P=T0 and there are three options for each Q and R.
%Due to symmetry we assume that Q=[0,0,0;1,0,0;0,0,1] and then we check 
% for R=[0,0,0;1,0,0;0,0,1], [0,0,0;0,1,0;0,0,1] and [0,0,0;1,1,0;0,0,1]
% whether L(T0+Q+R)=3 and  conclude that Q=R= one of these three options.

P=[1,0,0;0,1,0;-1,-1,0];
Q=[0,0,0;1,0,0;0,0,1];
PQ=minksum(P,Q);

R=[0,0,0;1,0,0;0,0,1];
minkthree(minksum(PQ,R))

R=[0,0,0;0,1,0;0,0,1];
minkthree(minksum(PQ,R))

R=[0,0,0;1,1,0;0,0,1];
minkthree(minksum(PQ,R))

%Proposition 4.3 Here we show that if |P|=|Q|=|R|=4 and each of P and Q is 
%individually equivalent to S1 then up to a lattice translation P=Q=R=S1.
%We can assume that P=S1. Then we find all tetrahedra Q such that L(P+Q)=2
%and recorded them in A of size 4x3x39. We then run through A, check the 
%volume of each of the tetrahedra and record the ones of volume 1 into AA. 
%There are j-1=11 of them. Finally for each Q of volume one in AA and each 
%R in A we check whether L(S1+Q+R)=3. We get 9 pairs (Q,R) in the output 
%where up to translation Q=R=S1.

S1=[0,0,0;1,0,0;0,1,0;0,0,1];
  [x,y,z]=GoodBox(S1);
  A=FindTetra(S1,x,y,z);
  S=size(A);
  s=S(1,3);
  j=1;
  AA=zeros(S);
  for i=1:s %compute the volume of the tetrahedron A[:,:,i]
      B=zeros(3,3);
      B(1,:)=A(2,:,i)-A(1,:,i);
      B(2,:)=A(3,:,i)-A(1,:,i);
      B(3,:)=A(4,:,i)-A(1,:,i);
      if abs(det(B))==1
          AA(:,:,j)=A(:,:,i);
          j=j+1;
      end
  end
  AA
  j %There are j-1 non-zero teratrahedra in AA
  
  for k=1:j-1
          for l=1:s
              Q=AA(:,:,k);
              R=A(:,:,l);
              if minkthree(minksum(minksum(S1,Q),R))
                  Q
                  R
              end
          end
  end


%Theorem 4.4 Check that L(3S2)=3
S2=[1,0,0;0,1,0;0,0,1;1,1,1];
minkthree(minksum(minksum(S2,S2),S2))

%Check that L(2S+K2)>3
K2=[1,0,0;0,1,0;1,1,2;-1,-1,-1];
S=[0,1,0;1,0,0;1,1,2;0,0,0];
minkthree(minksum(minksum(K2,S),S))

%Check that L(2S2+E)=3
S2=[1,0,0;0,1,0;0,0,1;1,1,1];
E=[0,0,0;1,0,0;0,1,0;0,0,1;1,1,1];
minkthree(minksum(minksum(S2,E),S2))

%Check that L(2K1+S1)>3
S1=[0,0,0;1,0,0;0,1,0;0,0,1];
K1=[1,0,0;0,1,0;0,0,1;-1,-1,-1];
minkthree(minksum(minksum(K1,K1),S1))

%Check that L(3K1)>3
 
K1=[1,0,0;0,1,0;0,0,1;-1,-1,-1];
minkthree(minksum(K1,minksum(K1,K1)))



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
K1=[1,0,0;0,1,0;0,0,1;-1,-1,-1];
S1=[1,0,0;0,1,0;0,0,1;0,0,0];
minkthree(minksum(R1,minksum(K1,K1)))
R2=[1,0,0;0,1,0;-1,-1,-1;0,0,0];
minkthree(minksum(R2,minksum(K1,K1)))


S2=[1,0,0;0,1,0;0,0,1;1,1,1];
  [x,y,z]=GoodBox(S2);
  A= FindTetra(S2,x,y,z);
  S=size(A);
  s=S(1,3);
  for i=1:s
      B=zeros(3,3);
      B(1,:)=A(2,:,i)-A(1,:,i);
      B(2,:)=A(3,:,i)-A(1,:,i);
      B(3,:)=A(4,:,i)-A(1,:,i);
      if abs(det(B))==1 & minkthree(minksum(A(:,:,i),minksum(S2,S2)))
          A(:,:,i),i   
      end
  end
S2=[1,0,0;0,1,0;0,0,1;1,1,1];
P=[0,0,0;1,0,0;0,1,0;1,1,1];
minkthree(minksum(P,minksum(S2,S2)))
A=[0,0,0;0,-1,1;1,-1,0;2,-2,-1];
det(A)






 P=[1,0,0;0,1,0;0,0,1;1,1,1];
 PQ=minksum(P,P);
  [x,y,z]=GoodBox(PQ);
  A= FindTetra(S2,x,y,z);
for a=-3:3
    for b=-3:3
        Q(3,:)=[a,b,-1];
        PQ=minksum(P,Q);
        if AddTriangleHuh2(PQ,9,9,2)
            Q
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%
P=[1,0,0;0,1,0;0,0,1;1,4,1];
[x,y,z]=GoodBox(P);
FindTriangles(P,x,y,z)

P=[1,0,0;0,1,0;0,0,1;1,4,1];
[x,y,z]=GoodBox(P);
AddTriangleHuh(P,x,y,z)



