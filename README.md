# minkowski-length
Magma code implementing computer search to classify maximal decompositions in 3D polytopes of Minkowski length up to 3, as described in our paper _F_q-zeros of sparse trivariate polynomials and toric 3-fold codes_ (https://arxiv.org/abs/2105.10071). Joint work with Kyle Meyer and Jenya Soprunova.

Given a lattice polytope P, the _Minkowski length_ L(P) is the largest L such that P contains the Minkowski sum of L non-trivial lattice polytopes. Every such sum is called a maximal decomposition in P. 

Functions:

**minkone(P)**
Checks if L(P)=1 for a lattice polytope P

**minktwo(X)**
Checks if L(P)<=2 for a lattice polytope P

**minkthree(X)**
Checks if L(P)<=3 for a lattice polytope P

**GoodPolytope(P)**
Returns the polytope given by inequalities x>=0 and |ax + by + cz| <= 14 for each facet inner normal (a, b, c) of P

**FindSegments(P,x,y,z)**
Finds all primitive segments which can be in a maximal decomposition with P. Returns a list of lattice points pt such that [0,pt] is such a segment. The list does not contain two vectors that are negatives of each other.

**FindSegments2(P,x,y,z)**
Given P of L(P)=2, finds all segments I=[0,(p,q,r)] with |p|<=x, |q|<=y, and |r|<=z satisfying L(P+I)=3.

**AddTriangleHuh(P)**
Checks if there exists a triangle T such that L(P+T)=2

**AddTriangleHuh2(P,x,y,z)**
Given P of L(P)=2, checks if there exists a triangle T whose segments have absolute value bounded by x,y,z and L(P+T)=3

**AddTetraHuh(P)** 
Checks if there exists a lattice tetrahedron Q such that L(P+Q)=2. The tetrahedron may be degenerate.

**FindTriangles(P)**
Returns all triangles T such that L(P+T)=2

**FindTetra(P)**
Returns all lattice tetrahedra Q such that L(P+Q)=2. Some tetrahedra may be degenerate.

**GoodTriangles(S,i,j,k)**
Given an ordered list S of lattice points checks if \pm S[i], \pm S[j], \pm S[k] can serve as vectors of sides of a triangle. If yes, produces the list of pairs such that the pair together with the origin forms such a triangle; otherwise returns an empty list.

**IsTranslate(P,Q)**
Checks if two lattice polytopes P, Q are translates of each other

**Zonotope3In(P)**
Returns a list of all zonotopes in P which are a sum of three distinct primitive segments

Procedures named _LemmaX_Y.mgm_, _PropositionX_Y.mgm_, _TheoremX_Y.mgm_ check the finite cases in the proof of the corresponding statement in the paper.
