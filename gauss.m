function[x]=gauss(A,b)

[m,n]=size(A);
A=[A b];


for k=1:n-1

  %PIVOTEO
  fila=0;
  for j=k:n
    if fila<abs(A(j,k))
      fila=j;
    end
  end
aux=A(k,:);
A(k,:)=A(fila,:);
A(fila,:)=aux ; 

  %ELIMINACION
  for i =k+1:n
  mi=A(i,k)/A(k,k);
    for j=k:n+1
      A(i,j)=A(i,j)-mi*A(k,j);
    end
  end
end
  C=A(1:n,1:n);
  d=A(1:n,n+1);
  trisup(C,d)
end


