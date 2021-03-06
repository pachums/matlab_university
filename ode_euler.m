#METODO DE EULER PASO VARIABLE
function[T,Y,Neval]=ode_euler(ode_fun,tspan,Y0,tol,NMax,NFrac)
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

n=1; #numero pasos
k=0; #contador fracasos
t0=tspan(1); #extremo inicial
tf=tspan(2); #extremo final
y=Y0; #c.i.
T=[t0]; #T vector cuya  primera comp. es el instante inicial
Y(1,1:length(Y0))=Y0; 
f0=ode_fun(t0,y); 
Neval=1; #acabamos de evaluar la funcion


#CALCULAMOS LONGITUD PASO
if norm(f0)==0
  h=(tf-t0)/4;
  else 
  h=sqrt(tol/norm(f0));
endif
while t0<tf && n<=NMax
  if h>tf-t0 #nos salimos del intervalo de integracion
    h=(tf-t0); #consideramos el paso para estar dentro del tspan
               #cuanto mas pequeño el paso tendremos una particion mayor
  endif
  
#HALLAMOS VALOR APROX. 
tp=t0+h; #paso de prueba
z=y+h*f0; #siguiente valor aprox.
f1=ode_fun(tp,z); #para hallar el error
Neval=Neval+1; #contamos una nueva evaluacion de la funcion ode_fun
r=(h/2)*norm(f1-f0); #error

#ANALIZAMOS LA TOLERANCIA
    if r<tol #actualizamos valor
      #definimos de nuevo los parametros para repetir el proceso
      t0=tp;
      y=z;
      f0=f1;
      T(n+1)=t0;
      Y(n+1,:)=y;
      n=n+1;
      k=0; #reinicio fracasos
        
        #valoramos si el error es considerablemente mayor que al tolerancia
        if r<tol/4
        h=2*h; #agrando el paso
        else
        h=0.9*h*sqrt(tol/r); #considero dicho paso
        endif
        
    else #no actualizamos valor
      k=k+1; #contamoso un nuevo fracaso al tratar de hallar un paso 
      if k==NFrac
        break #llegamos al num.max. de intentos de hallar un paso
      else
        h=0.9*h*sqrt(tol/r); #considero dicho paso
      endif
    endif
endwhile
T=T';

#plot(T',Y,'*','Color','blue') #rep. grafica caso unidimensional
endfunction

      
      
      
      