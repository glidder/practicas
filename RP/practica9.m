%Practica 9

function [] = practica9()
	%Ejercicio 1
	%a)
	%e1([2 2]',0.01)
	%b)
	%e1([2 2]',0.5)
	%c)
	%e1([2 2]',0.005)
	%d)
	%Ejercicio 2
	e2();
end
function i = e1(input,step)
	[x,y]=meshgrid(-3:0.1:3,-4:0.1:4);
	z = (x.^2 + 2*x + 3*y.^2);
	pcolor(x,y,z),shading flat;hold on;
	sol = input;
	i=1;
	x=sol(1,i);
	y=sol(2,i);
	dx = 2*x + 2;
	dy = 6*y;
	sol(:,i+1) = sol(:,i) - 0.01 * [dx;dy];
	plot([sol(1,i) sol(1,i+1)],[sol(2,i) sol(2,i+1)],'r', 'LineWidth',3)
	i=i+1;
	while abs(sol(:,i)-sol(:,i-1)) >0.0001,
		x=sol(1,i);
		y=sol(2,i);
		dx = 2*x + 2;
		dy = 6*y;
		sol(:,i+1) = sol(:,i) - step * [dx;dy];
		plot([sol(1,i) sol(1,i+1)],[sol(2,i) sol(2,i+1)],'r', 'LineWidth',3)
		i=i+1;
		pause(0.1);
	end
end

function i= e2()
	[x,y]=meshgrid(-10:0.1:10,-10:0.1:10);
	z = 100*(x.^2-y.^2)+(1-x).^2;
	pcolor(x,y,z),shading flat;hold on;
	sol = [10 10]';
	i=1;
	x=sol(1,i);
		y=sol(2,i);
		dx = 200*x+2*x-1;
		dy = -200*y;
		dxx = 202;
		dxy = 1;
		dyx = 1;
		dyy = -200;
		H = [dxx dxy;dyx dyy];
		sol(:,i+1) = sol(:,i) - 0.1 * inv(H) * ([dx;dy]);
		plot([sol(1,i) sol(1,i+1)],[sol(2,i) sol(2,i+1)],'r')
	i=i+1;
	while abs(sol(:,i)-sol(:,i-1)) >0.0001,
		x=sol(1,i);
		y=sol(2,i);
		dx = 200*x+2*x-1;
		dy = -200*y;
		dxx = 202;
		dxy = 1;
		dyx = 1;
		dyy = -200;
		H = [dxx dxy;dyx dyy];
		sol(:,i+1) = sol(:,i) - 0.1 * inv(H) * ([dx;dy]);
		plot([sol(1,i) sol(1,i+1)],[sol(2,i) sol(2,i+1)],'r')
		i=i+1;
		pause(0.1);
	end
end
