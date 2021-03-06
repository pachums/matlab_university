A=unifrnd(9,5,1000,10000);
for i=1:1000
B(i)=10000*min(A(i,:));
endfor
x=-1:0.01:10;
plot(x,empirical_cdf(x,B))
hold on
plot(x,expcdf(x,5),'r')
