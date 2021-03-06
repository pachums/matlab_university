U=unifrnd(0,1,2000,1);
for i=1:2000
if(U(i)>0)&&(U(i)<0.5)
Z(i)=U(i);
elseif U(i)==0.5
Z(i)=0.5;
elseif (U(i)>0.5)&&(U(i)<1)
Z(i)=U(i)+0.5;
endif
endfor
x=-0.1:0.1:1.5;
plot(x,empirical_cdf(x,Z))