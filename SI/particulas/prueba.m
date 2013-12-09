%Ejecución con 20 y 30 reinas para una población de 40 tableros.
Bv20=0;
Bv30=0;
for i=1:10
	[t20,v20,j]=NReinas(20,40,0.5,0.8,0.8);
	if(v20>Bv20)
		Bv20=v20; Bt20=t20; Bj20=j;
	end
	[t30,v30,j]=NReinas(30,40,0.5,0.8,0.8);
	if(v30>Bv30)
		Bv30=v30; Bt30=t30; Bj30=j
	end
end

Display('Mejor tablero para 20 reinas:')
Bt20
Bv20
Bj20
Display('Mejor tablero para 30 reinas:')
Bt30
Bv30
Bj30

