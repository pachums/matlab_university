% ODE_EULER1
%
% Resuelve un problema de valor inicial mediante el m�todo de Euler.
% ODE_EULER1 resuelve el problema de valor inicial
%        y'(t)=f(t,y), con t en [t0,tf]
%        y(t0)=y0
% utilizando el m�todo de Euler con paso constante. El paso es h=(tf-t0)/N.
%
% Sintaxis:
%    [T,Y]=ode_euler1(odefun,[t0,tf],y0,N)
% Argumentos de entrada:
%    odefun : funcion que evalua el termino derecho de la EDO.
%    [t0,tf]: intervalo en el que se define la EDO.
%    y0     : condicion inicial en t0 (y0 puede ser un vector fila).
%    N      : numero de pasos (el paso es h=(tf-t0)/N).
%
% Argumentos de salida:
%    T      : vector columna con la particion de [t0,tf].
%    Y      : matriz con la solucion aproximada (por columnas)
% El argumento odefun puede ser una funci�n an�nima o estar definida en un
% archivo de funcion.
%
function [T,Y]=ode_euler1(odefun,tspan,y0,N)
% 
m=length(y0); % m es el numero de ecuaciones
% Construimos la particion T (como vector columna) y el paso h
t0=tspan(1);tf=tspan(2); T=linspace(t0,tf,N+1).'; h=(tf-t0)/N;
% Definimos una matriz Y que va a almacenar la solucion del problema
Y=zeros(N+1,m);
Y(1,1:m)=y0; % condicion inicial
% Bucle del metodo de Euler con paso constante h
for n=1:N
    Y(n+1,1:m)=Y(n,1:m)+h*odefun(T(n),Y(n,1:m));
end
end % FIN de function