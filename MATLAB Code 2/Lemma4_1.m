%Lemma 4.1  Part 1: Let I_1=[0,0,0;1,0,0], I_2=[0,0,0;,0,1,0], and 
% I_3=[0,0,0;a,b,c] with a<=b<c<=14. Here we find largest c such that  
% L(I_1+I_2+I_3)=3

P=[0,0,0;1,0,0];
Q=[0,0,0;0,1,0];
PQ=minksum(P,Q);
R=zeros(2,3);
maxheight1=0;

for c=1:14
    for b=0:c-1
        for a=0:b
            R(2,:)=[a,b,c];
            if minkthree(minksum(PQ,R))
                maxheight1=c;
            end
        end
    end
end

maxheight1

% Part 2: Let I_1=[0,0,0;1,0,0], I_2=[0,0,0;,1,2,0], and 
% I_3=[0,0,0;a,b,c] with a<=b<c<=14. Here we find largest c such that  
% L(I_1+I_2+I_3)=3

maxheight2=0;
P=[0,0,0;1,0,0];
Q=[0,0,0;1,2,0];
PQ=minksum(P,Q);


for c=1:14
    for b=0:c-1
        for a=1:b
            R(2,:)=[a,b,c];
            if minkthree(minksum(PQ,R))
                maxheight2=c;
            end
        end
    end
end

maxheight2