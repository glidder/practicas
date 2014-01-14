function []=practica12()
	S1='LAS COORDENADAS DE LA GSBHBUB HAN SIDO FIJADAS EN FM NBS EF BMCPSBO FO MB QBSUF MAS OCCIDENTAL DEL MAR MEDITERRANEO TUPQ MB WFMPDJEBE DEL VIENTO ES DE UNOS VEINTE NUDOS Z MB QSPGVOEJEBE FT DE DOSCIENTOS METROS STOP'
	estimstates1 = [ones(1,18) 2*ones(1,7) ones(1,16) 2*ones(1,23) ones(1,31) 2*ones(1, 15) ones(1,28) 2*ones(1,16) ones(1,22)];
	%Ejercicio 1
	V1=transformar(S1);
	%Ejercicio 2
	[A, B]=entrenar(V1, estimstates1);
	states1 = hmmviterbi(V1,A,B);
	S1r=recomponer(S1, states1)
	%Ejercicio 3
	S2='LAS TROPAS SE ENCUENTRAN EN LA GSPOUFSB DPO FM FOFNJHP STOP SE RECOMIENDA DETENER LA PQFSBDJPO STOP MB HVFSSB IB UFSNJOBEP'
	V2=transformar(S2);
	states2=hmmviterbi(V2,A,B);
	S2r=recomponer(S2, states2)
	%Error = calcularError([ones(1,25) 2*ones(1,20) ones(1,25) 2*ones(1,9) ones(1,4) 2*ones(1,19)], states2)
	Error=1-(3/length(S2))
	
end

function V=transformar(S)
	Sp=strrep(S,' ','');
	V=Sp-'A'+1;
end

function [A, B]=entrenar(V, estimstates)
	[estimA,estimB] = hmmestimate(V, estimstates);
	[A, B] = hmmtrain(V, estimA, estimB);
end

%function Error=calcularError(estimstates, states)
%	Error= 1-(sum(find(estimstates~=states))/length(estimstates))
%end

function Sr=recomponer(S, states)
	j=0;
	for i=1:length(S)
		if (S(i)~=' ')
			j=j+1;
			if(states(j)==2)
				Sr(i)=S(i)-1;
			else
				Sr(i)=S(i);
			end
		else
			Sr(i)=S(i);
		end
	end
end
				
