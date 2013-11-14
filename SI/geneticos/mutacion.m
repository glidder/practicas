function mutados=mutacion(poblacion, pmut)
	mutados=poblacion;
	for i=1:size(poblacion,1)
		if(rand(1)<=pmut)
			mutados(i,:)=poblacion(i,:);
			ind=randi(size(poblacion,2),[1,2])
			mutados(i,ind(1))=poblacion(i,ind(2));
			mutados(i,ind(2))=poblacion(i,ind(1));
		end
end
