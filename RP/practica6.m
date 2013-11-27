%Practica 6
%Ejercicio 1
%a)
m1=[1;1]; C1=[1 0;0 1];
x=[randnorm(m1,C1,1000)];
y=[zeros(1,1000)];
figure, plotpat(x,y);
hold on;
axis([-4 6 -4 6]);

%b)
m2=[1;1]; C2=[1 0;0 0.1];
x=[randnorm(m2,C2,1000)];
y=[ones(1,1000)];
figure, plotpat(x,y);
hold on;
axis([-4 6 -4 6]);

%c)
m2=[1;1]; C2=[0.1 0;0 1];
x=[randnorm(m2,C2,1000)];
y=[ones(1,1000)];
figure, plotpat(x,y);
hold on;
axis([-4 6 -4 6]);

%d)
m2=[1;1]; C2=[1 0.5;0 1];
x=[randnorm(m2,C2,1000)];
y=[ones(1,1000)];
figure, plotpat(x,y);
hold on;
axis([-4 6 -4 6]);

%e)
m2=[1;1]; C2=[1 0;0.5 1];
x=[randnorm(m2,C2,1000)];
y=[ones(1,1000)];
figure, plotpat(x,y);
hold on;
axis([-4 6 -4 6]);

%f)
m2=[1;1]; C2=[0.5 0.2;0.2 0.3];
x=[randnorm(m2,C2,1000)];
y=[zeros(1,1000)];
figure, plotpat(x,y);
hold on;
axis([-4 6 -4 6])

%g)
m2=[1;1]; C2=[0.3 0.2;0.2 0.5];
x=[randnorm(m2,C2,1000)];
y=[zeros(1,1000)];
figure, plotpat(x,y);
hold on;
axis([-4 6 -4 6])

%Ejercicio 2
%a)

