%Practica 3, SI. NReinas y Backtracking
%autor: Luis José Quintana Bolaño
%
function psr=crea_PSR_N_Reinas(NR)
    NReinas(1:NR)=NaN;
    Vfuturos=ones(NR,NR); %Esta parte es solo para forward-checking, pero
    					  %"busqueda_con_vuelta_atras" también lo arrastra
    					  %si no creo una clase "crea_PSR_..." aparte.
    					  %Lo he dejado así para usar el mismo PSR en los 2
    					  %métodos al hacer las pruebas.
    psr=struct( 'tablero',NReinas,'posibles',Vfuturos);
end
