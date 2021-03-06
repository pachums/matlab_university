#Dos personas llegan aleatoriamente entre 5 y 6 
A=unifrnd(5,6,10000,1);
B=unifrnd(5,6,10000,1);
j=0;
for i=1:10000
if(abs(B(i)-A(i))<=1/6)
j=j+1;
endif
endfor
p=j/10000