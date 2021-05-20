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