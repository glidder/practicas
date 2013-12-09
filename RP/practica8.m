%Luis José Quintana Bolaño
%Practica 8
function [] = practica8()
	%Ejercicio 1
	x1=[6.1543 7.9194 9.2181 7.3821 1.7627 4.0571 9.3547 9.1690 4.1027 8.9365];
	y1=[21.0518 23.0857 31.0830 27.3933 5.9044 15.8872 32.5721 26.3197 11.4262 29.9518];
	x2=[6.1543 7.9194 9.2181 7.3821 1.7627 4.0571 9.3547 9.1690 4.1027 8.9365 15];
	y2=[21.0518 23.0857 31.0830 27.3933 5.9044 15.8872 32.5721 26.3197 11.4262 29.9518 2];
	%a)
	[sol, E]=AjusteRecta(x1,y1)
	%b)
	[sol, E]=AjusteRecta(x2,y2)
	%c)
	AjustePolinomio(x1',y1')
	AjustePolinomio(x2',y2')
	%d)
	AjustePolinomio2(x1',y1')
	AjustePolinomio2(x2',y2')
	%e)
	AjustePolinomio3(x1',y1')%(1./(y1.*y1))')
	AjustePolinomio3(x2',y2')%(1./(y2.*y2))')
	%Ejercicio 2
	%a)
		ej2(x1,y1,1) %a
		ej2(x2,y2,1) %b
		ej2(x1,y1,2) %c
		ej2(x2,y2,2) %c
		ej2(x1,y1,3) %d
		ej2(x2,y2,3) %d
	%b)
		roots(polyfit(x1,y1,2)) %Apartado 1 c
		roots(polyfit(x1,y1,3)) %Apartado 1 d
	
end

function [sol, E]=AjusteRecta(x, y)
	Sxx=sum(x.*x); Sx=sum(x);
	Sxy=sum(x.*y); Sy=sum(y);
	n=length(x);
	A=[Sxx Sx; Sx n]; b=[Sxy Sy]';
	sol=A\b;
	figure, plot (x,y,'o'); hold on;
	axis([0 35 0 35]);
	xr=[0 10];
	yr=[sol(2) sol(1)*10+sol(2)];
	plot (xr,yr); hold off;
	E=sum((y-(sol(1)*x+sol(2))).^2);
end
function []=AjustePolinomio(x, y)
	x2=x.*x;
	A = [x2 x ones(size(x))];
	polisol = inv(A'*A)*(A'*y);
	figure, plot (x,y,'o');
	axis([0 35 0 35]); hold on;
	xp=linspace(0,10);
	plot (xp,polyval(polisol,xp));
	hold off;
end
function []=AjustePolinomio2(x,y)
	x2=x.*x;
	x3=x.*x2
	A = [x3 x2 x ones(size(x))];
	polisol = inv(A'*A)*(A'*y);
	figure, plot (x,y,'o');
	axis([0 35 0 35]); hold on;
	xp=linspace(0,10);
	plot (xp,polyval(polisol,xp));
	hold off;
end
function []=AjustePolinomio3(x,y)
	[x, i]=sort(x);
	y=y(i);
	y=1./(y.*y);
	yp=log(y);
	% solucion del problema lineal
	A = [x ones(size(x))];
	sol = inv(A'*A)*(A'*yp);
	B=sol(1); C=sol(2);
	% calculamos los parámetros de la exponencial
	A=exp(C);
	figure, plot (x,y,'o');
	axis([0 10 0 2]); hold on;
	plot (x,A*exp(B*x),'r'); hold off;
end
function []=ej2(x,y,ex)
	p=polyfit(x,y,ex);
	figure, plot(x,y,'o'); hold on;
	axis([0 35 0 35]);
	xp=linspace(0,35);
	plot(xp,polyval(p,xp));hold off;
end
