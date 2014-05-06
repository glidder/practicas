function W = adaltrain(E,Sd)
    %La primera columna corresponde al bias, un 1.
    E = [ones(size(E,1),1) E];
    W = zeros(1,size(E,2));
    i = 1;
    Err = 1;
    ErrAnt = inf;
    alpha = 0.1;
    niter = 1000;
    cont = 0;
    
    %El bucle se mantendrá durante un número fijo de iteraciones, o
    %mientras el cálculo del error no supere el valor épsilon establecido
    while cont < niter & abs(ErrAnt-Err) > 0.001
        So = E(i,:)*W';
        ErrAnt = Err;
        Err = Sd(i)-So;
        W = W + alpha*Err*E(i,:);
        cont = cont + 1;
        i = mod(i,size(E,1))+1;
    end
    plot(E(:,2),E(:,3),'or');hold on 
    plot(E(:,2),(W(2)*E(:,2)+W(1))/-W(3),'b');hold off; 

end
