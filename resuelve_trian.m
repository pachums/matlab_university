function [x]=resuelve_trian(A,b)
h=length(b)
[m,n]=size(A)
x(1)=b(1)/A(1,1)
  for i=2:n
    for j=1:i-1
  x(i)=(b(i)-A(i,j)*x(j))/A(i,i)
    end
  end
 end