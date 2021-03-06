Y1=normrnd(0,1,20000,1);
Y2=normrnd(0,1,20000,1);
X1=2*Y1;
X2=(1/2)*Y1+sqrt(1-(1/4))*Y2+4;
Z=[X1,X2];


c=0;
for i=1:20000
T(i)=(abs(Z(i,1)))*Z(i,2)+2*Z(i,1)*Z(i,2)^2+1;
if T(i)>=2
c=c+1;
endif
endfor
pr=c/20000


W=abs(X1).*X2+2*X1.*X2.^2+1;
x=-2:0.01:4;
plot(x,empirical_cdf(x,W))