function psr=crea_PSR_N_Reinas(NR)
    NReinas=zeros(1,NR);
    dominios=(ones(NR,1)*(1:NR))';
    psr=struct( 'tablero',NReinas,'dominios',dominios);
end