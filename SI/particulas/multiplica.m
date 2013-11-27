function V=multiplica(r,Vm)
	Pv=rand(size(Vm,1));
	j=1;
	V=[];
	for i=1:size(Vm,1);
		if(Pv(i)>r)
			V(j,:)=Vm(i,:);
			j=j+1;
		end
	end	
end
