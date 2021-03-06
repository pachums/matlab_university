U=unifrnd(0,1,2000,1);
for i=1:2000
if(U(i)>0)&&(U(i)<1)
Z(i)=U(i)/2+1/4;
elseif 
Z(i)=1
endif
endfor

x=-0.1:0.1:1.6
plot(x,empirical_cdf(x,Z))