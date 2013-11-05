function solucion = Tabu_Search(estado,M)
    Mejor=estado;
    [sucesores, ind]= calculasucesores(estado); %Calcula todos los sucesores
    tabu=zeros(length(estado));
    i=1000;
    Maux=estado;
    contador=1;
    while (i>0 && contador<5)
        i=i-1;
        for j=1:length(sucesores)
        	val(j)=Evaluacion(sucesores(j,:),M); %Evalua todos los sucesores
        end
        [P,I]=sort(val,2,'ascend'); %Obtiene los indices de los sucesores ordenados
        							%por el valor de la evaluacion
        while length(sucesores)>0
            Nuevo=sucesores(I(1),:); %Toma el sucesor evaluado con menor valor
            sucesores=removerows(sucesores,'ind',[I(1)]); %Lo extrae de la lista
            Ni=ind(I(1),:);
            ind=removerows(ind,'ind',[I(1)]);
            I=removerows(I,'ind',[1]);
            I(:)= I(:)+1; %aumenta en 1 los indices para reflejar la extraccion
            if tabu(Ni(1),Ni(2))==0 %No es tabu
                estado=Nuevo;
                tabu(Ni(1),Ni(2))=3; %Lo añade la lista tabu
                if Evaluacion(estado,M)<Evaluacion(Mejor,M)
                    Mejor=estado; %El sucesor es el mejor estado
                end
                sucesores=[];
            else	%Es tabu
                if Evaluacion(Nuevo)<Evaluacion(Mejor)
                    estado=Nuevo;
                    Mejor=Nuevo;
                    tabu(Ni(1),Ni(2))=3; %Refresca el valor de permanencia
                    sucesores=[];
                end
            end
            for i=1:length(tabu) %Reduce la permanenia de la lista tabu
                for j=1:length(tabu)
                    tabu(i,j)=tabu(i,j)-1;
                    if tabu(i,j)<0
                        tabu(i,j)=0;
                    end
                end
            end
        end
        if (Mejor-Maux)==0
        	contador = contador+1;
        else Maux = Mejor;
        	 contador = 1;
        end
    end
    solucion=Mejor;
end

function [solucion, ind]=calculasucesores(estado)
    k=1;
    for i=1:length(estado)
        for j=1:length(estado)
            solucion(k,:)=estado;
            solucion(k,i)=estado(j);
            solucion(k,j)=estado(i);
            ind(k,:)=[i j];
            k=k+1;
        end
    end
end
