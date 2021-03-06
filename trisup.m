function[x]=trisup(A,b)

[m,n]=size(A);
A=[A b];
x=zeros(n,1);
x(n)=A(n,n+1)/A(n,n);

for i=n-1:-1:1
sum=0;
  for j=n:-1:i+1
  sum=sum+A(i,j)*x(j);
  endfor
x(i)=(A(i,n+1)-sum)/A(i,i);
endfor

end
