mu=[1,-1]; #vectormedias
sigma=[0.1,2;2,01]; #matrizcovarianzas
rho=sigma(1,2)/sqrt(sigma(1,1)*sigma(2,2)); #coef. de correlacion
x=linspace(-4,6,100);
y=linspace(-6,4,100);
[xx,yy]=meshgrid(x,y);
#programamos funcion de densidad 7-10
ll=((xx.-mu(1))/sigma(1,1)).^2+((yy.-mu(2))/sigma(2,2)).^2;
jj=(xx.-mu(1)).*(yy.-mu(2)).*2*rho/(sigma(1,1)*sigma(2,2));
ww=e.^((-1/(2*(1-rho^2)))*(ll-jj));
zz=(1/(2*pi*sigma(1,1)*sigma(2,2)*sqrt(1-rho^2)))*ww; #almacenamos valores de f.d.
mesh(xx,yy,zz)
