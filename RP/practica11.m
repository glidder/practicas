function [] = practica11()
	ejercicio1();
	ejercicio2();
end

function [] = ejercicio1()
	rand('seed', 0);
	randn('seed', 0);
	x=randnorm([3,4],[1 0.8;0.8 1],1000);
	m=mean(x');
	x(1,:)=x(1,:)-m(1);
	x(2,:)=x(2,:)-m(2);
	W=pca(x);
	x1=W*x;
	plotpat(x,'.b'); hold on;
	plotpat(x1,'og');hold off;
	x2 = pinv(W) * x1;
	plotpat(x,'.b'); hold on;
	plotpat(x2,'og');hold off;
	PIPCA = sumsqr(x) - sumsqr(x1);
	PIR = sumsqr(x) - sumsqr(x2);
	disp(['Perdida de informacion tras PCA: ' num2str(PIPCA)])
	disp(['Perdida de informacion tras reconst.:' num2str(PIR)])
	Wp=W-0.2;
	x1=W*x;
	x2 = pinv(W) * x1;
	PIPCA= sumsqr(x) - sumsqr(x1);
	PIR= sumsqr(x) - sumsqr(x2);
	disp(['Perdida de informacion tras PCA y W modificada: ' num2str(PIPCA)])
	disp(['Perdida de informacion tras reconst. y W mod.:' num2str(PIR)])
	%Nope	
end

function []=ejercicio2()
	rand('seed', 0);
	randn('seed', 0);
	C1=randnorm([3,4],[1 0.8;0.8 1],1000);
	C2=randnorm([5,0],[1 0.8;0.8 1],1000);
	[x y]=shuffle([C1 C2], [zeros(1, 1000) ones(1, 1000)]);
	m=mean(x');
	x(1,:)=x(1,:)-m(1);
	x(2,:)=x(2,:)-m(2);
	W=pca(x);
	x1=W*x;
	figure, plotpat(x,'.b');hold on;
	plotpat(x1,'og');hold off;
	%W=fisher(x,);
	figure, plotpat(x,'.b');hold on;
	plotpat(x2,'og');hold off;
	
end

function []=ejercicio3()
	
end

