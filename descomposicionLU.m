function[L,U]=descomposicionLU(A)

[m,n]=size(A);
L=[];
U=[];
sum=0;

U(1,1)=A(1,1);
L(1,1)=1;
for i=2:n
L(i,i)=1;
L(i,1)=A(i,1)/A(1,1);
end

for j=2:n
  for i=1:j
    for k=1:i-1
      sum=sum+L(i,k)*U(k,j);
    end
  U(i,j)=A(i,j)-sum;
  end
  sum=0;
  for i=j+1:n
    for k=1:j-1
      sum=sum+L(i,k)*U(k,j);
    end
  L(i,j)=(A(i,j)-sum)/U(j,j);
  end
  sum=0;
 end

  
end
