function solucion = Tabu_Search()
    [estado, M]=Tareas();
    Mejor=estado;
    [sucesores, ind]= calculasucesores(estado);
    tabu=zeros(length(estado));
    i=1000;
    while i>0
        i=i-1;
        Ma(1:length(sucesores))=M;
        val=arrayfun(Evaluacion,sucesores,Ma);
        [P,I]=sort(val,1,'ascend');
        while length(sucesores)>0
            Nuevo=sucesores(I(1),:);
            sucesores=removerows(sucesores,'ind',[I(1)]);
            Ni=ind(I(1),:);
            ind=removerows(ind,'ind',[I(1)]);
            I=removerows(I,'ind',[1]);
            I(:)= I(:)+1;
            if tabu(Ni(1),Ni(2))==0
                estado=Nuevo;
                tabu(Ni(1),Ni(2))=3;
                if Evaluacion(estado,M)<Evaluacion(Mejor,M)
                    Mejor=estado;
                end
                sucesores=[];
            else
                if Evaluacion(Nuevo)<Evaluacion(Mejor)
                    estado=Nuevo;
                    Mejor=Nuevo;
                    tabu(Ni(1),Ni(2))=3;
                    sucesores=[];
                end
            end
            for i=1:length(tabu)
                for j=1:length(tabu)
                    tabu(i,j)=tabu(i,j)-1;
                    if tabu(i,j)<0
                        tabu(i,j)=0;
                    end
                end
            end
        end
    end
end

function [solucion, ind]=calculasucesores(estado)
    k=1;
    for i=1:length(estado)
        for j=1:length(estado)
            solucion(k,:)=estado;
            solucion(k,i)=estado(j);
            solucion(k,j)=estado(i);
            ind(k,:)=[i j]
            k=k+1;
        end
    end
end
    %    ____      ______  ______      ______ _____ ______
    %    |   |  |  |_____  |_____      |    | |     |
    %    |___|  |       |       |      |    | |____ |_____
    %    |      |  _____|  _____|      |____| |     |   