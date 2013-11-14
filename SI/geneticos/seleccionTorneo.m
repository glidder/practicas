function tempPob = seleccionTorneo(poblacion)
	evalPob=EvaluaPoblacion(poblacion);
	 k=2;
	 for i=1:length(evalPob)
	 	r=randperm(length(evalPob),k)';
	 	m=evalPob(r,:);
	 	[aux,auxi]=max(m);
	 	tempPob(i,:)=poblacion(r(auxi(1)),:);
	 end
end
