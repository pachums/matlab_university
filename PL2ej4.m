#Usamos el programa PL2ej2
i=1:8;
M=discrete_rnd(i,[2,1,2,2,1,2,1,1],1,500);
for j=1:500;
if(M(1,j)==1)
Z(j,:)=[-2,-1];
elseif(M(1,j)==2)
Z(j,:)=[-2,0];
elseif(M(1,j)==3)
Z(j,:)=[-2,1];
elseif(M(1,j)==4)
Z(j,:)=[1,-1];
elseif(M(1,j)==5)
Z(j,:)=[1,0];
elseif(M(1,j)==6)
Z(j,:)=[1,1];
elseif(M(1,j)==7)
Z(j,:)=[2,-1];
elseif(M(1,j)==8)
Z(j,:)=[2,1];
endif
endfor
Z;
#Hallaremos Y|X=-2
m=1;
for i=1:500;
if(Z(i,1)==-2)
D(m)=Z(i,2);
m=m+1;
endif
endfor
mean(D);
