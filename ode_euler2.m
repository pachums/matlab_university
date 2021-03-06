function[T,Y,Neval]=ode_euler2(ode_fun,tspan,y0,tol,nmax,nfrac)
n=1 %numero pasos
k=0 %contador fracasos
ti=tspan(1) #extremo inicial
tf=tspan(2) #extremo final
y=y0 #c.i.
T=[ti] %T vector cuya 1ªcomp instante inicial
Y(1,1:length(y0))=y0 
f0=ode_fun(ti,y) 
Neval=1



#CALCULAMOS LONGITUD PASO

if norm(f0)==0
  h=(ti+tf)/2;
else 
  h=sqrt(tol/norm(f0))
endif

while ti<tf && n<=nmax
  if h>tf-ti
    h=tf-ti
  endif
  
#HALLAMOS VALOR APROX. 
tp=ti+h #paso de prueba
z=y+h*f0 #siguiente valor aprox
f1=ode_fun(tp,z); #hallar error luego
Neval=Neval+1
r=(h/2)*norm(f1-f0)#error

#ANALIZAMOS LA TOLERANCIA
    if r<tol %actualizamos valor
      ti=tp
      y=z
      f0=f1
      T(n+1)=ti
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

endfunction

      
      
      
      