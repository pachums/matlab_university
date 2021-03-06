function [xn,iter]=gradienteconjugado(A,b,x0,nmax,tol)
  x=x0;
  r=b-A*x;
  p=r;
  for k=1:nmax
    num=r'*r;
    q=A*p;
    den=p'*q;
    alfa=num/den;
    %act residuos
    x=x+alfa*p;
    r1=r-alfa*q;
    %nueva
    beta=(r1'*r1)/(r'*r);
    r=r1;
    p=r+beta*p;
    error=norm(r)/norm(b);
    if(error<tol)
      break
    end
    if (k==nmax)
      xn=[];%sale xn vacio porque si no podria acercarse a la solucion o no, habria que repetir con mas iteraciones a ver si converge
      iter=nmax;
    end
  end
  xn=x;
  iter=k;
endfunction