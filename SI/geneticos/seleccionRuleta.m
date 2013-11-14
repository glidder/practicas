function tempPob = seleccionRuleta(poblacion)
	evalPob=EvaluaPoblacion(poblacion);
	Ruleta=evalPob;
	for i=2:length(evalPob)
		Ruleta(i)=Ruleta(i)+Ruleta(i-1);
	end
	
	Prob=randi(Ruleta(length(Ruleta)),[1,length(Ruleta)])
	for i=1:length(Prob)
		j=1;
		while(Ruleta(j)<Prob(i))
			j=j+1;
		end
		tempPob(i,:)=poblacion(j,:);
	end
end
