function Snew=aplicaVelocidad(S,V)
	Snew=S;
	for i=1:size(V,1)
        aux=Snew(V(i,1));
		Snew(V(i,1))=Snew(V(i,2));
		Snew(V(i,2))=aux;
	end
end
