%Practica 3, SI. NReinas y Backtracking
%autor: Luis José Quintana Bolaño
%
function solucion = busqueda_con_forward_checking( psr )
	paux = forward_checking_recursiva( psr );
	solucion = paux.tablero;
end
