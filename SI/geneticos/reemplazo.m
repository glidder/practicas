function poblacion = reemplazo(oldPob, desc)
	poblacion=oldPob;
	poblacion(1:size(desc,1),:)=desc(1:size(desc,1),:);
end
