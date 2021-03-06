A=unifrnd(0,5,100,1000);
for i=1:100
B(i)=max(A(i,:));
endfor
x=4:0.001:6;
plot(x,empirical_cdf(x,B))