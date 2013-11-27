function Vkj=sumaVelocidades(Vk,Vj)
	Vkj=[];
	if size(Vk,1)>size(Vj,1)
		min=size(Vj,1);
		max=size(Vk,1);
		Vm=Vk;
	else
		min=size(Vk,1);
		max=size(Vj,1);
		Vm=Vj;
	end
	for i=1:min
		if Vk(i,2)==Vj(i,1)
			Vkj(i,1)=Vk(i,1);Vkj(i,2)=Vj(i,2);
		else
			Vkj(i,:)=Vk(i,:);
		end
	end
	for i=min+1:max
		Vkj(i,:)=Vm(i,:);
end
