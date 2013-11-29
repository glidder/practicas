function [Btab,Bval,i]=NReinas(N, P, w, cp, cg)
	poblacion=generarPoblacion(N, P);
	pbest=poblacion;
	v=cell(P,1);
	for i=1:P
		v{i}=ones(1,2);
	end
	i=1;
	val=EvaluaPoblacion(poblacion);
	[X, I]=max(val);
	gbest=poblacion(I(1),:);
	NMax=sum(1:N-1);
	while i<1000 && sum(find(val==NMax))==0
		for j=1:P
			SUMP=sumaVelocidades(multiplica(w,v{j}),multiplica(cp*rand(),sustraeTableros(pbest(j),poblacion(j,:))));
			SUMG=multiplica(cg*rand(),sustraeTableros(gbest,poblacion(j,:)));
			v{j}=sumaVelocidades(SUMP,SUMG);
			poblacion(j,:)=aplicaVelocidad(poblacion(j,:),v{j});
		end
		val=EvaluaPoblacion(poblacion);
		[X, I]=max(val);
		gbest=poblacion(I(1),:);
		Y=find(val>EvaluaPoblacion(pbest));
		pbest(Y)=poblacion(Y);
		i=i+1;
	end
	[X, I]=max(val);
	Btab=poblacion(I(1),:);
	Bval=val(I(1));
end
