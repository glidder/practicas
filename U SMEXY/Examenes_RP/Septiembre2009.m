clc
clear all

randn('seed',0); rand('seed',0);
x=[2+randn(1,180) 4+0.2*randn(1,20)];
y=[zeros(1,180) ones(1,20)];
[x,y]=shuffle(x,y);

%Apartado a
costes=[300 6300;100300 6300];

%Apartado b
costes=costes-300;

clase0=x(find(y==0));
clase1=x(find(y==1));

m0=mean(clase0);
m1=mean(clase1);

s0=std(clase0);
s1=std(clase1);

Pw0=length(clase0)/length(x);
Pw1=length(clase1)/length(x);

C0=costes(2,1)/sum(costes(:));
C1=costes(1,2)/sum(costes(:));

A=s0*s0-s1*s1;
B=2*(m0*s1*s1-m1*s0*s0);
C=2*s0*s0*s1*s1*(log(Pw0)-log(Pw1)-log(s0)+log(s1))+s0*s0*m1*m1-s1*s1*m0*m0;

x1=(-B+sqrt(B*B-4*A*C))/2/A;
x2=(-B-sqrt(B*B-4*A*C))/2/A;

xi=-5:0.001:5;
D0=normpdf(xi,m0,s0)*Pw0*C0;
D1=normpdf(xi,m1,s1)*Pw1*C1;

plot(xi,D0,'r');hold on;
plot(xi,D1,'b');hold off;


