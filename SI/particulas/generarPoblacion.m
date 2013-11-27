function poblacion=generarPoblacion(NReinas,NTableros)
	for i=1:NTableros
		poblacion(i,:)=randperm(NReinas);
	end
end
