#Para n=10000
x=1:10000;
x=x/10000
p=ones(1,10000);
A=discrete_rnd(x,p,1000,1);
x=-1:0.01:2
plot(x,empirical_cdf(x,A))
hold on
plot(x,unifcdf(x,0,1),'r')