%Problema 1
%Apartado 1
clc
clear all
load iris

orden = size(X,1);

[X,t]=shuffle(X',t');
for kk=1:orden
    [xtrn,xtst,ytrn,ytst]=crossval(X,t,orden,kk);
    
    clase1=xtrn(:,find(ytrn==0));
    clase2=xtrn(:,find(ytrn==1));
    clase3=xtrn(:,find(ytrn==2));
    
    m1=meanpat(clase1);
    m2=meanpat(clase2);
    m3=meanpat(clase3);  

    d1=d_euclid(xtst,m1);
    d2=d_euclid(xtst,m2);
    d3=d_euclid(xtst,m3);
   
    [a,b] = min([d1 d2 d3]);
    salida_y=b-1;
    
    error(kk)=length(find(salida_y~=ytst))/length(ytst);
end
error1=mean(error)
%figure, plotpat(xtst,salida_y);

%Apartado 2

for kk=1:orden
    [xtrn,xtst,ytrn,ytst]=crossval(X,t,orden,kk);
    
    clase1=xtrn(:,find(ytrn==0));
    clase2=xtrn(:,find(ytrn==1));
    clase3=xtrn(:,find(ytrn==2));
    
    m1=meanpat(clase1);
    m2=meanpat(clase2);
    m3=meanpat(clase3);
    
    c1=covpat(clase1);
    c2=covpat(clase2);
    c3=covpat(clase3);
    
    d1=d_mahal(xtst,m1,c1);
    d2=d_mahal(xtst,m2,c2);
    d3=d_mahal(xtst,m3,c3);
    
    [a,b] = min([d1 d2 d3]);
    salida_y=b-1;
    
    error(kk)=length(find(salida_y~=ytst))/length(ytst);
end
error2=mean(error)
%figure, plotpat(xtst,salida_y);

%Apartado 3

for i=1:5
    for kk=1:orden
        [xtrn,xtst,ytrn,ytst]=crossval(X,t,orden,kk);
        salida_y=knnclsfy(xtrn,ytrn,xtst,i);
        error(kk)=length(find(salida_y~=ytst))/length(ytst);
    end
    error3(i)=mean(error);
end



