function [A] = Busqueda_Local(n, m)
    [M, A, C]=Tareas(n, m);
    for i=1:m-1
        H(i,:)=Nueva_Asignacion(A,1,i+1)
        h(i)=Evaluacion(M,H(i,:))
    end
    while not(all(h>C))%C>h(:)
        k=find(h==min(h));
        if h(k)<C
            C=h(k);
            A=H(k,:);
            for i=1:m-1
                H(i,:)=Nueva_Asignacion(A,1,i+1)
                h(i)=Evaluacion(M,H(i,:))
            end
        end   
    end
end