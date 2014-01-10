%Practica 10
%Ejercicio 1: Valicación
function [] = practica10()
	
	%Validación simple
	simple()	
	%Validación cruzada orden 10
	
	%Validación Leave - One - Out

end

function [] = simple()
	rand('seed', 0);
	randn('seed', 0);
	grado1=0;
	grado2=0;
	grado3=0;
	for i=1:1000
		x = rand(1,100);
		y = exp(x.^3 - x.^2 + 0.01*x + 2) + 0.04 * randn(size(x));
		x1=x(1:70);
		y1=y(1:70);
		x2=x(71:100);
		y2=y(71:100);
	
		[P, S]=polyfit(x1, y1,1);
		Y = polyval(P,x2);
		grado1=grado1+sum((y2-Y).^2);

		[P, S]=polyfit(x1, y1, 2);
		Y=polyval(P,x2);
		grado2=grado2+sum((y2-Y).^2);
	
		[P, S]=polyfit(x1, y1, 3);
		Y=polyval(P,x2);
		grado3=grado3+sum((y2-Y).^2);
	end
	grado1=grado1/1000
	grado2=grado2/1000
	grado3=grado3/1000
end
