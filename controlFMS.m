#CONTROL PL ANM
Francisco Martínez Serrano 
UO251177

#EJERICIO 1-1)
function[B]=cholesky(A)
[m,n]=size(A); #Analizamos la dimensión de la matriz
#creamos la para almacenar los sumatorios del algoritmo
sum=0;

for j=1:n
  for k=1:j-1
    #primer sumatorio necesario para después hallar B(j,j)
    sum=sum+B(j,k)^2;
  end
#Hallamos B(j,j)
B(j,j)=sqrt(A(j,j)-sum);
sum=0; #Para poder reutilizar la variable

  for i=j+1:n
    for k=1:j-1
      #sumatorio necesario para hallar los elemetos B(i,j)
      sum=sum+B(i,k)*B(j,k);
    end
#Hallamos B(i,j)
    B(i,j)=(A(i,j)-sum)/B(j,j);
    sum=0; #Para poder reutilizar la variable
  end
end


#EJERCICIO 1-2)
A=[];
for i=1:4
  for j=1:4
    A(i,j)=min(i,j); #creamos la matriz A de la forma pedida
  end
end
[B]=cholesky(A) #aplicamos la función anterior dicha matriz
#Nos devuelve la matriz: B=[1 0 0 0; 1 1 0 0; 1 1 1 0; 1 1 1 1];


#EJERCICIO 2-1)
function [x]=jacobiw(A,b,x0,w,iter)
[n,m]=size(A) #dimensiones de la matriz
x(1:n,1)=x0 #trabajaremos con ello en las iteraciones

for k=1:iter #Repeticiones tantas como interaciones 
  for i=1:n
  #declaramos los sumatorios para trabajar con ellos
  sum1=0
  sum2=0
    for j=1:(i-1)
      #el primer sumatorio del algoritmo
      sum1=sum1+A(i,j)*x(j,k)
    endfor
    for j=(i+1):n
      #el segundo sumatorio del algoritmo
      sum2=sum2+A(i,j)*x(j,k)
    endfor
x(i,k+1)=(w*(b(i)-sum1-sum2))/A(i,i) + (1-w)*x(i,k)
  endfor
endfor
endfunction



#EJERCICIO 2-2)
A=[4 -1 0; -2 4 1; 1 2 4]
b=[10 -11 2]'
x0=[0 0 0]'
w=0.5
niter=5
[x]=jacobiw(A,b,x0,w,niter)
#Nos devuelve la solución de x la siguiente matriz
0.00000   1.25000   1.70312   1.87891   1.95068   1.98087
0.00000  -1.37500  -1.78125  -1.91016  -1.95581  -1.97455
0.00000   0.25000   0.56250   0.76367   0.87451   0.93237

#interpretamos que tras la 5 iteracion tenemos la solución x=[1.98087 -1.97455 0.93237]' con más iteraciones se aproxima mejor a la solución real x=[2 -2 1]'


