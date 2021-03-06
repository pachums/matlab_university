Y1=normrnd(0,1,20000,1);
Y2=normrnd(0,1,20000,1);
X1=2*Y1+2;
X2=sqrt(3)*(sqrt(1/3)*Y1+sqrt(1-(1/3)^2)*Y2)+3;
Z=[X1,X2];

c=0;
for i=1:20000
T(i)=((Z(i,1))^2*(Z(i,2))^2+(Z(i,1)*Z(i,2))) / ((Z(i,1))^4+2);
if T(i)>=2
c=c+1;
endif
endfor
pr=c/20000