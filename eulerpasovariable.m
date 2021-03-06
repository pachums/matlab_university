function[T,Y,Neval]=ode_euler(tspan,y0,tol,nmax,nfrac)
n=1 %numero pasos
k=0 %contador fracasos
t=tspan(1) #extremo inicial
tf=tspan(2) #extremo final
y=y0 #c.i.
T=[t] %T vector cuya 1ªcomp instante inicial
Y(1,1_length(y0))=y0 
f0=f(t,y) 
Neval=1

#CALCULAMOS LONGITUD PASO
if norm(f0)==0
  h=(t+tf)/2;
else 
  h=sqrt(tol/norm(f0))
endif

while t<tf && n<=nmax
  if h>tf-t
    h=tf-t
  endif
  
#HALLAMOS VALOR APROX. 
tp=t+h #paso de prueba
z=y+h*f0 #siguiente valor aprox
f1=f(tp,z);
Neval=Neval+1
r=(h/2)*norm(f1-f0)#error

#ANALIZAMOS LA TOLERANCIA
    if r<tol %actualizamos valor
      t=tp
      y=z
      f0=f1
      T(n+1)=t
      Y(n+1)=y
      n=n+1
      k=0; #reinicio fracasos
      
        if r<tol/4
        h=2*h
        else
        h=0.9*h*sqrt(tol/r)
        endif
        
    else %no act. valor
      k=k+1
      if k==nfrac
        printf('alcanzado maximo \n')
        break
      else
        h=0.9*h*sqrt(tol/r);
      endif
    endif
endwhile
T=T'
endfunction

      
      
      
      