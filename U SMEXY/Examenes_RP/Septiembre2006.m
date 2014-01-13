%problema 1 

%x=abalone(:,1:end-1);
%y=abalone(:,end);

rand('seed',0);
[xd,yd]=shuffle(x,y);

xtrain=xd(:,1:400);
ytrain=yd(:,1:400);

xtest=xd(:,401:end);
ytest=yd(:,401:end);

%Apartado b
for i=1:10
    [xtrn,xtst,ytrn,ytst]=crossval(xtrain,ytrain,10,i);
    
    A=[ xtrn' ones(size(xtrn))'];
    coef=pinv(A)*ytrn';
    %y_salida=A*coef;
    
    %ErrorTrn(i)=100*mean(round(y_salida)~=ytrn);
    
    A=[ xtst' ones(size(xtst))'];
    y_salida=A*coef;

    Error(i)=100*mean(round(y_salida)~=ytst');
end
ErrorTrn1=mean(Error);

A=[ xtest' ones(size(xtest))'];
y_salida=A*coef;
    
ErrorTst1=100*mean(round(y_salida)~=ytest');



for j=1:8
    w=pca(xd,i);
    datos_pca=w*xd;

    xtrain=datos_pca(:,1:400);
    xtest=datos_pca(:,401:end);
    
    for i=1:10
        [xtrn,xtst,ytrn,ytst]=crossval(xtrain,ytrain,10,i);
        A=[ xtrn' ones(size(xtrn))'];
        coef=pinv(A)*ytrn';
        %y_salida=A*coef;

        %ErrorTrn(i)=100*mean(round(y_salida)~=ytrn);

        A=[ xtst' ones(size(xtst))'];
        coef=pinv(A)*ytst';
        y_salida=A*coef;

        Error(i)=100*mean(round(y_salida)~=ytst');
    end
    ErrorTrn(j)=mean(Error);
    
    A=[ xtest' ones(size(xtest))'];
    y_salida=A*coef;
    
    ErrorTst(j)=100*mean(round(y_salida)~=ytest');
end
ErrorTrn2=mean(ErrorTrn);
ErrorTst2=mean(ErrorTst);


for j=1:8
    xd=subpat(xd,meanpat(xd));
    w=fisher(xd,yd,i);
    datos_fisher=w*xd;

    xtrain=datos_fisher(:,1:400);
    xtest=datos_fisher(:,401:end);
  
    for i=1:10
        [xtrn,xtst,ytrn,ytst]=crossval(xtrain,ytrain,10,i);
        A=[ xtrn' ones(size(xtrn))'];
        coef=pinv(A)*ytrn';
        %y_salida=A*coef;

        %ErrorTrn(i)=100*mean(round(y_salida)~=ytrn);

        A=[ xtst' ones(size(xtst))'];
        coef=pinv(A)*ytst';
        y_salida=A*coef;

        Error(i)=100*mean(round(y_salida)~=ytst');
    end
    ErrorTrn(j)=mean(Error);
    
    A=[ xtest' ones(size(xtest))'];
    y_salida=A*coef;
    
    ErrorTst(j)=100*mean(round(y_salida)~=ytest');
end
ErrorTrn3=mean(ErrorTrn);
ErrorTst3=mean(ErrorTst);