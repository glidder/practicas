rand('seed',0);
M = [12 43 15 7; 9 10 6 4; 5 13 29 2; 4 11 17 9];
for i=1:100
	estado=randperm(4);
	vSA(i)=Evaluacion(Simulated_Annealing(estado,M),M);
	vTS(i)=Evaluacion(Tabu_Search(estado,M),M);
	vBL(i)=Evaluacion(Busqueda_Local(estado,M),M);
    if(mod(i,10)==0)disp([num2str(i) '% completado']);end
end

figure, hist(vSA);
title('Simulated Annealing');
figure, hist(vTS);
title('Tabu Search');
figure, hist(vBL);
title('Local Search');