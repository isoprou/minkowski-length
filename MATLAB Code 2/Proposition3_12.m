%Proposition 3.12 We check that are no triangles Q such that L(T_1=2+Q)=2
   P=[1,0,0;0,1,0;-1,-1,0;2,1,3];
          [x,y,z]=GoodBox(P);
            R = FindTriangles(P,x,y,z);
            R