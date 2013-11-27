function V=sustraeTableros(Sk,Sj)
	j=1;
	V=[];
	aux=Sk;
	for i=1:size(Sk)
		if aux(i)~=Sj(i)
			V(j,:)=[i find(Sj==Sk(i),1)];
			aux(i)=Sj(i);
			aux(V(j,2))=Sj(V(j,2));
			j=j+1;
		end
	end
end
