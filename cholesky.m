function[B]=cholesky(A)

[m,n]=size(A);
B(1,1)=sqrt(A(1,1));
sum=0;

for i=2:n

  for j=1:i-1
  
    for k=1:j-1
      sum=sum+B(i,k)*B(j,k);
    end
B(i,j)=(A(j,i)-sum)/B(j,j);
sum=0;
  end
  
  for k=1:i-1
    sum=sum+B(i,k)^2;
  end
B(i,i)=sqrt(A(i,i)-sum);
sum=0;

end
