function soluciones=NReinas(N, P)
	for i=1:10
		resultados(i,:)=Iteracion(N, P)
	end
end

%poblacion = generarPoblacion(10,50)
%val=EvaluaPoblacion(poblacion)
%tempPob=seleccionTorneo(poblacion)
%tempPob=seleccionRuleta(poblacion)
%Par=Emparejar(length(tempPob),0.7)
%cruzados=cruzePMX(tempPob,Par)
%cruzados=cruzeOX(tempPob,Par)
%mutados=mutacion(cruzados,0.2)
%poblacion=reemplazo(poblacion,mutados)

function resultado= Iteracion(N, P)
	poblacion=generarPoblacion(N,P);
	tempPob=seleccionRuleta(poblacion);
	resultado=reemplazo(poblacion,mutacion(cruzeOX(tempPob,Emparejar(length(tempPob),0.8)),0.2));
end
