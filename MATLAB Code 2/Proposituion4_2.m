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