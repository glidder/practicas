%Luis José Quintana Bolaño
%Practica 3
%Ejercicio 1
function [] = practica3( )
    disp(['Ejercicio 1'])
    disp(['A'])
    a=A(10)
    disp(['B'])
    b=B(a)
    disp(['C'])
    c=C(10);
    figure, hist(c/10);
    disp(['D'])
    d1=C(100);
    figure, hist(d1/100);
    d2=C(1000);
    figure, hist(d2/1000);
    %d3=C(10000);
    %figure, hist(d3/10000);
    disp(['E'])
    disp(['Medias'])
    mean(c)
    mean(d1)
    mean(d2)
    %mean(d3)
    %La media no se ve afectada 
    disp(['Varianzas'])
    var(c)
    var(d1)
    var(d2)
    %var(d3)
    %A medida que la población aumenta, la varianza disminuye.
    disp(['F'])
    F();
    
end

function sol = A(N)
    sol=rand(1,N);
end
function sol = B( a )
    sol=mean(a);
end

function sol = C( N )
    for i=1:1000%000
        sol(i)=B(A(N));
    end
end

function sol = Ac(N)
    sol=chi2rnd(100,1,N);
end

function sol = Cc(N)
    for i=1:1000%000
        sol(i)=B(Ac(N));
    end
end

function sol=Af(N)
    sol=frnd(100,100,1,N);
end
function sol=Cf(N)
    for i=1:1000%000
        sol(i)=B(Af(N));
    end
end
function sol=Ar(N)
    sol=rand(1,N).^2;
end
function sol=Cr(N)
    for i=1:1000%000
        sol(i)=B(Ar(N));
    end
end
function [] = F( )
    disp(['Chi2rnd'])
    c=Cc(10);
    figure, hist(c/10);
    d1=Cc(100);
    figure, hist(d1/100);
    d2=Cc(1000);
    figure, hist(d2/1000);
    %d3=C(10000);
    %figure, hist(d3/10000);
    disp(['Medias'])
    mean(c)
    mean(d1)
    mean(d2)
    %mean(d3)
    %La media no se ve afectada 
    disp(['Varianzas'])
    var(c)
    var(d1)
    var(d2)
    %var(d3)
    disp(['frnd'])
    c=Cf(10);
    figure, hist(c/10);
    d1=Cf(100);
    figure, hist(d1/100);
    d2=Cf(1000);
    figure, hist(d2/1000);
    %d3=Cf(10000);
    %figure, hist(d3/10000);
    disp(['Medias'])
    mean(c)
    mean(d1)
    mean(d2)
    %mean(d3)
    %La media no se ve afectada 
    disp(['Varianzas'])
    var(c)
    var(d1)
    var(d2)
    %var(d3)
    disp(['rand^2'])
    c=Cr(10);
    figure, hist(c/10);
    d1=Cr(100);
    figure, hist(d1/100);
    d2=Cr(1000);
    figure, hist(d2/1000);
    %d3=Cr(10000);
    %figure, hist(d3/10000);
    disp(['Medias'])
    mean(c)
    mean(d1)
    mean(d2)
    %mean(d3)
    %La media no se ve afectada 
    disp(['Varianzas'])
    var(c)
    var(d1)
    var(d2)
    %var(d3)

end

