function sol = busqueda_con_vuelta_atras(psr)
    a(1:length(psr.tablero))=NaN;
    sol=vuelta_atras_recursiva(a,psr);
end