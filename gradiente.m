function[xn,niter]=gradiente(A,b,x0,nmax,tol)
x=x0;
r=b-A*x;
for k=1:nmax
	num=r'*r;
	q=A*r;
	den=q'*r;
	alpha=num/den;
	x=x+alpha*r;
	r=r-alpha*q;
	error=norm(r)/norm(b);
	if (error<tol)
		break
	endif
	if(k==nmax)
	x=[];
	endif
endfor
xn=x;
niter=k;
endfunction