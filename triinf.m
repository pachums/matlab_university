function[x]=triinf(A,b)

[m,n]=size(A);
A=[A b];
x=zeros(n,1);
x(1)=A(1,n+1)/A(1,1);

for i=2:n
sum=0;
  for j=1:i-1
  sum=sum+A(i,j)*x(j);
  endfor
x(i)=(A(i,n+1)-sum)/A(i,i);
endfor

end


