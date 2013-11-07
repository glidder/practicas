function parejas=Emparejar(tempPob,Pcross)
	parejas=find(rand(N,1)< Pcross);
	if rem(size(parejas,1),2);
		parejas=parejas(1:(size(parejas,1)-1));
	end
	parejas=reshape(parejas,size(parejas,1)/2,2);
	
end
