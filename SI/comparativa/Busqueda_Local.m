function estado = Busqueda_Local(estado, M)
    C=Evaluacion(estado,M);
    Maux=estado;
    contador=1;
    for i=1:length(estado)-1
        H(i,:)=Nueva_Asignacion(estado,1,i+1);
        h(i)=Evaluacion(H(i,:),M);
    end
    while (not(all(h>C)) && contador<5)
        k=find(h==min(h),1);
        if h(k)<C
            C=h(k);
            estado=H(k,:);
            H=[];
            for i=1:length(estado)-1
                H(i,:)=Nueva_Asignacion(estado,1,i+1);
                h(i)=Evaluacion(H(i,:),M);
            end
        end 
        if (estado-Maux)==0
        	contador = contador+1;
        else 
        	Maux = estado;
        	contador = 1;
        end  
    end
end
