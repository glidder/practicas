function Epob=EvaluaPoblacion(poblacion)
	for i=1:length(poblacion(:,1))
		Epob(i,:)=fevalTablero(poblacion(i,:));
	end
end

function e=fevalTablero(T)
	e=0;
	NMax=0;
	for i=1:length(T)-1
		for j=i+1:length(T)
			e=e+(abs(T(i)-T(j))==abs(i-j));
		end
	end
	NMax=sum(1:length(T)-1);
	e=NMax-e; 
end
