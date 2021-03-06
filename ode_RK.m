#MÉTODOS RK ENCAJADOS CON PASO VARIABLES

function[T,Y,Neval]=ode_RK(ode_fun,tspan,Y0,tol,NMax,NFrac)
###ENTRADA
#ode_fun ecuacion diferencial que aproximaremos
#stpan=[t0 tf] intervalo donde integraremos
#Y= condicion inicial en t0
#tol tolerancia del proceso
#NMax numero maximo de pasos permitidos
#NFrac numero maximo de fracasos para hallar un paso valido
###SALIDA
#T particion utilizada
#Y solucion aproximada en los instantes de la particion
#Neval numero de evaluaciones de odefun

c1=0;c2=2/3;c3=0;
a11=0;a21=2/3;a22=0;a31=-1;a32=1;a33=0;
b1=0;b2=3/4;b3=1/4;
b1e=1/4;b2e=3/4;b3e=0;

n=1; #numero pasos
k=0; #contador fracasos
t0=tspan(1); #extremo inicial
tf=tspan(2); #extremo final
y=Y0; #c.i.
T=[t0]; #T vector cuya  primera comp. es el instante inicial
Y(1,1:length(Y0))=Y0; 
k1=ode_fun(t0,y);
Neval=1;
emax=0;hmax=0;


#CALCULAMOS LONGITUD PASO
if norm(k1)==0
  h=(tf-t0)/4;
  else 
  h=min(sqrt(tol/norm(k1)),tf-t0); #cubica
endif

while t0<tf && n<=NMax
  
  k1=ode_fun(t0,y).';
  k2=ode_fun(t0+c2*h,y+h*a21*k1).';
  k3=ode_fun(t0+c3*h,y+h*a31*k1+h*a32*k2).';
  Neval=Neval+3; #contamos una nueva evaluacion de la funcion ode_fun

#HALLAMOS VALOR APROX. 
tp=t0+h; #paso de prueba
z=y+h*(b1*k1+b2*k2+b3*k3); #siguiente valor aprox.
#z=y+h*(b1e*k1+b2e*k2); #SI QUIERO PROBAR EL OTRO METODO
r=h*norm((b1-b1e)*k1+(b2-b2e)*k2+(b3-b3e)*k3); #error
emax=max(emax,r);


#ANALIZAMOS LA TOLERANCIA
    if r<tol #actualizamos valor
      #definimos de nuevo los parametros para repetir el proceso
      t0=tp;
      y=z;
      T(n+1)=t0;
      Y(n+1,:)=y;
      n=n+1;
      k=0; #reinicio fracasos
        
        #valoramos si el error es considerablemente mayor que al tolerancia
        if r<tol/4
        h=2*h; #agrando el paso
        else
        h=0.9*h*(tol/r)^(1/3); #considero dicho paso
        endif
        h=min(h,tf-t0);
        
    else #no actualizamos valor
      k=k+1; #contamoso un nuevo fracaso al tratar de hallar un paso 
      if k==NFrac
        break #llegamos al num.max. de intentos de hallar un paso
      else
        h=0.9*h*(tol/r)^(1/3); #considero dicho paso
      endif
    endif
    hmax=max(hmax,h);
endwhile
T=T';
printf('Error maximo: %d \n',emax)
printf('Paso maximo: %d \n',hmax)
printf('Numero de pasos: %d \n',length(T))
printf('ultima columna: %d \n',emax/hmax^3)



###PLOT's
if length(Y0)==1
plot(T',Y,'*','Color','blue') 
 elseif length(Y0)==2
  plot(T',Y(:,1),'*','Color','blue')
  hold on
  plot(T',Y(:,2),'*','Color','red')
  #plot(T,Y)
 elseif length(Y0)>2 #caso vectorial mayor a 2 dimensiones no representamos
  break;
endif
endfunction

      