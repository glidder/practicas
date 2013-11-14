function cruzado= cruzeOX( Poblacion, Pares)
	punto=ceil(size(Poblacion,2)*0.1)
	con=1;
	for i=1:size(Pares,1)
		p1=Poblacion(Pares(i,1),:)
		p2=Poblacion(Pares(i,2),:)
		h1=zeros(1,length(p1));
		h2=zeros(1,length(p2));
		h1(punto+1:length(h1)-punto)=p1(punto+1:length(p1)-punto);
		h2(punto+1:length(h2)-punto)=p2(punto+1:length(p2)-punto);
		for j=1:length(p1)
			if(j<=punto||j>(length(p1)-punto))
				aux=p2(j);
				while(not(all(h1~=aux)))
					aux=aux+1;
					if(aux>length(h1))
						aux=1;
					end
				end
				h1(j)=aux;
				aux=p1(j);
				while(not(all(h2~=aux)))
					aux=aux+1;
					if(aux>length(h2))
						aux=1
					end
				end
				h2(j)=aux;
			end
		end
		cruzado(con,:)=h1;
		cruzado(con+1,:)=h2;
		con=con+2;
	end
end
		
		
