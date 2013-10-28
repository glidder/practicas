%EJERCICIO 1        Luis José Quintana Bolaño
%Apartado a
rand('seed',0);
X = fix(rand(1,30)*100)

%Apartado b
for i=0:10:90
    disp(['Intervalo [' num2str(i) ', ' num2str(i+9) ']' ])
    s = size(find(X>=i & X<=i+9),2)
end

%Apartado c
figure, hist(X) %Reparte los elementos de X en 10 contenedores de igual intervalo
        %(eje x) y cuenta la cantidad de elementos en cada contenedor (eje y)
[a,b] = hist(X) % Devuelve dos vectores: a, con la cantidad de elementos de
                %cada contenedor y b, con el centro de cada contenedor en el eje x
a = hist(X,5:10:95);% Devuelve el vector a, con la cantidad de elementos de
                    % cada contenedor con los centros del eje x indicados
                    %por el vector 5:10:95 (de 5 a 95 en intervalos de 10)
[a,b] = hist(X,5:10:95);% Devuelve también un vector b con los centros.

%Apartado d

%Apartado e
sum(a) %30

%Apartado f
%La probabilidad de cada intervalo sale de dividir la cantidad de elementos 
%en cada intervalo (en el vector a) por la población total.
a/sum(a)

%Apartado g
%La suma de todas las probabilidades ha de ser 1.
sum(a) %=1

%Apartado h
rand('seed',0);
X1 = fix(rand(1,1000)*100);
figure, hist(X1) %Un mayor número de intervalos permite una determinación 
         % más precisa de la distribución

%Apartado i
rand('seed',0);
X2 = fix(rand(1,10000)*100);
figure, hist(X2)
%Como el rango de valores es de 100, no tiene sentido poner más de 100
%intervalos

%EJERCICIO 2
%Apartado a
X = rand(1,100000);
Y = randn(1,100000);

%Apartado b
figure, hist(X)
figure, hist(Y)
%Medias
media = [mean(X) mean(Y)]
%Rango
minmax = [min(X) max(X); min (Y) max(Y)]
%Suma histogramas
suma= [sum(hist(X)) sum(hist(Y)]
%Apartado c
m=mean(Y)
s=std(Y)

%Apartado d
a=hist(Y,m-s:m+s)
b=hist(Y,m-2s:m+2s)
c=hist(Y,m-3s:m+3s)