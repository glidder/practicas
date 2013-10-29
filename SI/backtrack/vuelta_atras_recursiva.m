%Practica 3, SI. NReinas y Backtracking
%autor: Luis José Quintana Bolaño
%
function sol= vuelta_atras_recursiva(asignacion)
    sol=asignacion;
    if sum(isnan(asignacion.tablero))~=0
        i=1;
    	error=true;
    	var=(length(asignacion.tablero)-sum(isnan(asignacion.tablero)))+1;
    	while i<=length(asignacion.tablero)
        	aux=asignacion.tablero;
        	aux(var)=i;
        	if restricciones(aux,var)
            	asignacion.tablero(var)=i;
            	sol=vuelta_atras_recursiva(asignacion);
            	if (all(sol.tablero~=0))
                	error=false;
                	i=length(asignacion.tablero);
            	end
        	end
        	i=i+1;
    	end
    	if(error==true)
        	sol.tablero=zeros(1,length(sol));
    	end
    end
end
