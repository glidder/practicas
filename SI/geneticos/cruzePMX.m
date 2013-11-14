function cruzado= cruzePMX( Poblacion, Pares)
	punto=ceil(size(Poblacion,2)*0.1)
	aux=1;
	for i=1:size(Pares,1)
		p1=Poblacion(Pares(i,1),:)
		p2=Poblacion(Pares(i,2),:)
		c1(p1(:))=p2(:);
		c2(p2(:))=p1(:);
		parte1=p1(punto+1:length(p1)-punto)
		parte2=p2(punto+1:length(p2)-punto)
		for j=1:length(p1)
			if(j<=punto||j>(length(p1)-punto))
				if(not(all(parte2~=p1(1,j))))
					h1(:,j)=c2(p1(j))
					con=1;
					while(not(all(parte2~=h1(j))))
						h1(:,j)=parte1(:,con)
						con=con+1;
					end	
				else
					h1(:,j)=p1(j);
				end
				if(not(all(parte1~=p2(1,j))))
					h2(:,j)=c1(p2(j));
					con=1;
					while(not(all(parte1~=h2(1,j))))
						h2(:,j)=parte2(:,con);
						con=con+1;
					end	
				else
					h2(:,j)=p2(j);
				end
			else
				h1(:,j)=p2(j);
				h2(:,j)=p1(j);
			end
		end
		cruzado(aux,:)=h1;
		cruzado(aux+1,:)=h2;
		aux=aux+2;
	end
end
		
		
