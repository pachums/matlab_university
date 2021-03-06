#PL2 EJERCICIO 3
#comando discrete_rnd(valores,prob.de valores,dim(n),dim(m))
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
X=Z(:,1);
Y=Z(:,2);
W=X.*Y;
x=-2:0.01:3;
plot(x,empirical_cdf(x,W)) #funcion de dist de XY, para estudiarla en un punto x=punto
