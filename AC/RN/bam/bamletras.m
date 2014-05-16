letras();
w=bamfit(E(1:3,:),Y(1:3,:));
%nE=distorsionarPatron(E,0.15);
for i=1:3
	n=bamval(w,Y(i,:));
	figure, imagesc(reshape(nE(i,:),7,7)');
	figure, imagesc(reshape(n,7,7)');
end
