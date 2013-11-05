%Practica 4
%Ejercicio 1
%a)
randn('seed',0);
%b)
w1=round(20+randn(1,2500)*3);
w2=round(25+randn(1,2500)*2);
h1=hist(w1, min(w1):max(w1));
h2=hist(w2, min(w2):max(w2));

figure
plot(min(w1):max(w1),h1, 'b');hold on;
plot(min(w2):max(w2),h2, 'r');hold off;

mean([mean(w1),mean(w2)])
%c)
w1=round(20+randn(1,5000*0,7)*3);
w2=round(25+randn(1,5000*0.3)*2);

%Ejercicio 2
%a)
    A1=randn(1,1000*0.3)*5+15;
    B1=randn(1,1000*0.7)*3+18;
%b)
    A2=randn(1,1000*0.4)*6+13;
    B2=randn(1,1000*0.6)*2+15;
%c)
    parzen(A1,B1);
    parzen(A2,B2);
%d)