%Practica 3, SI. NReinas y Backtracking
%autor: Luis José Quintana Bolaño
%

function solucion = forward_checking_recursiva( estado )
	solucion = estado;
    if sum( isnan( estado.tablero ) ) ~= 0;
    	error = true;
    	actual = find( isnan( estado.tablero ), 1 );
    	while (sum( estado.posibles(actual,:) ) ~= 0);
        	auxiliar = actualizar( estado, actual );
        	solucion = forward_checking_recursiva( auxiliar );
        	if sum(solucion.tablero) > 0
        		estado.posibles = estado.posibles(:) * 0;
        		error=false;
        	else
        		estado.posibles( actual, find( estado.posibles( actual,: ), 1 ) ) = 0;
        	end
    	end
    	if error == true
    		solucion.tablero = zeros(1,length(solucion.tablero));
    	end
    end
end
