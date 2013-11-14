%Practica 5
%Ejercicio 1
%a)
    A1=randn(1,1000*0.3)*5+15;
    B1=randn(1,1000*0.7)*3+18;
%b)
    A2=randn(1,1000*0.4)*6+13;
    B2=randn(1,1000*0.6)*2+15;
%c)
    h1=parzen(A1,B1);
    h2=parzen(A2,B2);
%d)
	fd=frontera_decision(mean(h1),std(h1),mean(h2),std(h2));
%Ejercicio 2
%a)
	A=s1*s1-s2*s2;
	B=2*(m1*s2*s2-m2*s1*s1);
	C=2*s1*s1*s2*s2*(log(Pw1)-log(Pw2)-log(s1)+log(s2))+s1*s1*m2*m2-s2*s2*m1*m1;
	x1=(-B+sqrt(B*B-4*A*C))/2/A
	x2=(-B-sqrt(B*B-4*A*C))/2/A
	
