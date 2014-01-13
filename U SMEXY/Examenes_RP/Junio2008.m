%Problema 1
%Apartado a
clear all
clc
load cancer.mat

x=subpat(x,meanpat(x));
W=fisher(x,y,2);
datos=W*x;

clase1=datos(:,find(y==0));
clase2=datos(:,find(y==1));

m1=meanpat(clase1);
m2=meanpat(clase2);

c1=covpat(clase1);
c2=covpat(clase2);

d1_mahal=d_mahal(clase1(:,end),m1,c1)
d2_mahal=d_mahal(clase2(:,end),m2,c2)

%Apartado b

centros1= kmeans(clase1,3,clase1(:,1:3));
centros2= kmeans(clase2,3,clase2(:,1:3));

for i=1:3
    d1(:,i)=d_euclid(datos,centros1(:,i));
    d2(:,i)=d_euclid(datos,centros2(:,i));
end

min1=minpat(d1);
min2=minpat(d2);

%A que clase pertenece cada punto
resultado(find(min1<=min2))=1;
resultado(find(min1>min2))=2;

plotpat(datos,resultado);

%A que centro pertenece cada punto
% resultado(find(d1(:,1)<=d1(:,2) & d1(:,1)<=d1(:,3) & d1(:,1)<=d2(:,1) & d1(:,1)<=d2(:,2) & d1(:,1)<=d2(:,3)))=1;
% resultado(find(d1(:,1)>d1(:,2) & d1(:,2)<=d1(:,3) & d1(:,2)<=d2(:,1) & d1(:,2)<=d2(:,2) & d1(:,2)<=d2(:,3)))=2;
% resultado(find(d1(:,1)>d1(:,3) & d1(:,2)>d1(:,3) & d1(:,3)<=d2(:,1) & d1(:,3)<=d2(:,2) & d1(:,3)<=d2(:,3)))=3;
% 
% resultado(find(d1(:,1)>d2(:,1) & d1(:,2)>d2(:,1) & d1(:,3)>d2(:,1) & d2(:,1)<=d2(:,2) & d2(:,1)<=d2(:,3)))=4;
% resultado(find(d1(:,1)>d2(:,2) & d1(:,2)>d2(:,2) & d1(:,3)>d2(:,2) & d2(:,1)>d2(:,2) & d2(:,2)<=d2(:,3)))=5;
% resultado(find(d1(:,1)>d2(:,3) & d1(:,2)>d2(:,3) & d1(:,3)>d2(:,3) & d2(:,1)>d2(:,3) & d2(:,2)>d2(:,3)))=6;


%Apartado c

