Y1=normrnd(0,1,1000,1);
Y2=normrnd(0,1,1000,1);
X1=2*Y1+2;
X2=sqrt(3)*(sqrt(1/3)*Y1+sqrt(1-(1/3)^2)*Y2)+3;
Z=[X1,X2];

clf
x=-1:0.01:5;
plot(x,empirical_cdf(x,X1),'r')
hold on
plot(x,normcdf(x,2,2),'b') #distribucion N(2,2)