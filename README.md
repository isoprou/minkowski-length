# minkowski-length
MATLAB code implementing computer search to classify maximal decompositions in 3D polytopes of Minkowski length up to 3, as described in "On the number of F_q-zeros of families of sparse trivariate polynomials". Joint work with Kyle Meyer and Jenya Soprunova.


Functions:

**GoodBox(P)**
Returns values x,y,z such that each segment I=[0,(p,q,r)] with L(P+I)=2 satisfies |p|<=x, |q|<=y, and |r|<=z

**FindSegments(P,x,y,z)**
Returns all segments I=[0,(p,q,r)] with |p|<=x, |q|<=y, and |r|<=z satisfying L(P+I)=2

**FindSegments2(P,x,y,z)**
Given P of L(P)=2, returns all segments I=[0,(p,q,r)] with |p|<=x, |q|<=y, and |r|<=z satisfying L(P+I)=3

**AddTriangleHuh(P,x,y,z)**
Checks if there exists a triangle T whose segments have absolute value bounded by x,y,z and L(P+T)=2

**AddTriangleHuh2(P,x,y,z)**
Given P of L(P)=2, checks if there exists a triangle T whose segments have absolute value bounded by x,y,z and L(P+T)=3

**AddTetraHuh(P,x,y,z)** 
Checks if there exists a 4-point polytope Q whose segments have absolute value bounded by x,y,z and L(P+Q)=2

**FindTriangles(P,x,y,z)**
Returns all triangles T whose segments have absolute value bounded by x,y,z and L(P+T)=2

**FindTetra(P,x,y,z)**
Returns all 4-point polytopes Q whose segments have absolute value bounded by x,y,z and L(P+Q)=2

**FindTetra2(P,x,y,z)**
Given P of L(P)=2, returns all 4-point polytopes Q whose segments have absolute value bounded by x,y,z and L(P+Q)=3

**minkone(X)**
Checks if L(conv(X))=1

**minktwo(X)**
Checks if L(conv(X))<3

**minkthree(X)**
Checks if L(conv(X))<4

**LP(X)**
Takes in a set of points X in R^3 as a n x 3 matrix, and outputs the lattice points in Conv(X) as PTS and the equations that define conv(X)

**minksum(X,Y)**
Calculates the Minkowski sum of X and Y


Procedures named _LemmaX_Y.m_, _PropositionX_Y.m_, _TheoremX_Y.m_ check the finite cases in the proof of the corresponding statement in the paper.
