%Practica 3, SI. NReinas y Backtracking
%autor: Luis José Quintana Bolaño
%
function sol = busqueda_con_vuelta_atras(psr)
    paux=vuelta_atras_recursiva(psr);
    sol= paux.tablero;
end
