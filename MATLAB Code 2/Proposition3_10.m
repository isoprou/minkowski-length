%Proposition 3.10 Here we find all triangles Q such that L(T_1+Q)=2
   P=[1,0,0;0,1,0;-1,-1,0;0,0,1];
          [x,y,z]=GoodBox(P);
            R = FindTriangles(P,x,y,z);
            R
 %Next we check that there are no 4-point sets Q such that L(T_1+Q)=2
   P=[1,0,0;0,1,0;-1,-1,0;0,0,1];
          [x,y,z]=GoodBox(P);
            R = FindTetra(P,x,y,z);
