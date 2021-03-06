function [x]=jacobi(A,b,x0,niter)
[n,m]=size(A);
x(1:n,1)=x0;
  for k=1:niter
    for i=1:n
    aux1=0;
    aux2=0;
      for j=1:(i-1)
        aux1=aux1+A(i,j)*x(j,k+1);
      endfor
      for j=(i+1):n
        aux2=aux2+A(i,j)*x(j,k);
      endfor
    x(i,k+1)=(b(i)-aux1-aux2)/A(i,i);
    endfor
  endfor
endfunction