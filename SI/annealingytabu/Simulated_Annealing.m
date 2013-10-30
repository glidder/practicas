function solucion = Simulated_Annealing()
    [estado, M]=Tareas();
    estado=sucesoraleatorio(estado);
    T=10000
    T_min=10
    while(T>T_min)
        nuevo=sucesoraleatorio(estado);
        deltaE=Evaluacion(nuevo, M)-Evaluacion(estado, M);
        if deltaE<0
            estado=nuevo;
        else
            p=exp(-deltaE/T);
            if p>rand(1)
                estado=nuevo;
            end
        end
        T=T-1;
    end
    solucion=estado;
    Evaluacion(estado,M)
end

function sol=sucesoraleatorio(estado)
    sol=estado;
    i = 1; j=i;
    while i==j
    i=randi(4,1);
    j=randi(4,1);
    end
    sol(i)=estado(j);
    sol(j)=estado(i);
end