%Proposition 3.5 For P=S_2 find all tetrahedra Q such that L(P+Q)=2.
S2=[1,0,0;0,1,0;0,0,1;1,1,1];
  [x,y,z]=GoodBox(S2);
  A= FindTetra(S2,x,y,z);
  S=size(A);
  s=S(1,3);
  for i=1:s
      B=zeros(3,3);
      B(1,:)=A(2,:,i)-A(1,:,i);
      B(2,:)=A(3,:,i)-A(1,:,i);
      B(3,:)=A(4,:,i)-A(1,:,i);
      if abs(det(B))==2
          A(:,:,i)
      end
  end