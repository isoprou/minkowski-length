%Proposition 3.15
%Now find tetrahedra Q that L(K1+Q)=2 and then L(K2+Q)=2

K1=[1,0,0;0,1,0;0,0,1;-1,-1,-1];
[x,y,z]=GoodBox(K1);
FindTetra(K1,x,y,z)

K2=[1,0,0;0,1,0;1,1,2;-1,-1,-1];
[x,y,z]=GoodBox(K2);
FindTetra(K2,x,y,z)