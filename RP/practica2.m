%Practica 2
%Ejercicio 1
%a)
randn('seed',0);
A = round(20 + randn(1,500)*5);% Doradas
B = round(30 + randn(1,500)*2);% Lubinas

%b)
figure, hist(A, min(A):max(A))
figure, hist(B, min(B):max(B))

%c)
a= hist(A, min(A):max(A));
b= hist(B, min(B):max(B));
pa=a/sum(a);
pb=b/sum(b);

%d)
for Frontera = 24:28
Err1 = length(find(A>Frontera));
Err2 = length(find(B<Frontera));
ErrTotal = Err1 + Err2;
disp([' Frontera = ' num2str(Frontera)])
disp([' Err1 Err2 ErrTot'])
disp([Err1 Err2 ErrTotal])
end

%e)
disp(['500 Doradas y 50 Lubinas'])
A = round(20 + randn(1,500)*5);% Doradas
B = round(30 + randn(1,50)*2);% Lubinas
for Frontera = 24:28
Err1 = length(find(A>Frontera));
Err2 = length(find(B<Frontera));
ErrTotal = Err1 + Err2;
disp([' Frontera = ' num2str(Frontera)])
disp([' Err1 Err2 ErrTot'])
disp([Err1 Err2 ErrTotal])
end
%El punto de error mínimo se ha desplazado a la derecha
disp(['500 Doradas y 50 Lubinas'])
A = round(20 + randn(1,50)*5);% Doradas
B = round(30 + randn(1,500)*2);% Lubinas
for Frontera = 24:28
Err1 = length(find(A>Frontera));
Err2 = length(find(B<Frontera));
ErrTotal = Err1 + Err2;
disp([' Frontera = ' num2str(Frontera)])
disp([' Err1 Err2 ErrTot'])
disp([Err1 Err2 ErrTotal])
end
%El punto de error mínimo se ha desplazado a la izquierda

%f)
ma = mean(A);
mb = mean(B);
aux= (ma+mb)/2
e=20;
while e>0
    xa=(ma+aux)/2;
    ea1 = length(find(A>xa));
    eb1 = length(find(B<xa));
    e1 = ea1 + eb1
    xb=(mb+aux)/2  ;
    ea2 = length(find(A>xb));
    eb2 = length(find(B<xb));
    e2 = ea2+eb2
    if e1 < e2
        mb=aux; aux=xa;e=e1;
    else
        ma=aux; aux=xb;e=e2;
    end
end