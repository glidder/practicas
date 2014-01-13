%problema 1 

%x=datos(:,1:end-1);
%y=datos(:,end);

rand('seed',0);
[xd,yd]=shuffle(x,y);

xtrn=xd(:,1:400);
ytrn=yd(:,1:400);

xtst=xd(:,401:end);
ytst=yd(:,401:end);

%Apartado a

A= [xtrn' ones(size(xtrn))'];
coef=pinv(A)*ytrn';
sol=A*coef;

ErrorTrn=sumsqr(ytrn'-sol)/size(xtrn,2);

A= [xtst' ones(size(xtst))'];
sol=A*coef;

ErrorTst=sumsqr(ytst'-sol)/size(xtst,2);

for i=3:5
    w=pca(xd,i);
    dastos_pca=w*xd;
    
    xtrn=dastos_pca(:,1:400);
    ytrn=yd(:,1:400);

    xtst=dastos_pca(:,401:end);
    ytst=yd(:,401:end);
        
    A= [xtrn' ones(size(xtrn))'];
    coef=pinv(A)*ytrn';
    sol=A*coef;

    ErrorTrnPCA(i-2)=sumsqr(ytrn'-sol)/size(xtrn,2);
    
    A= [xtst' ones(size(xtst))'];
    sol=A*coef;
 
    ErrorTstPCA(i-2)=sumsqr(ytst'-sol)/size(xtst,2);

end


