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