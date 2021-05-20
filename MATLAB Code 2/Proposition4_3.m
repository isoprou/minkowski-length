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
  