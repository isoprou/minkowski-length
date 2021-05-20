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