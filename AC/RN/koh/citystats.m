clear all;
load cities.mat

positions = hextop(6,6);


w=gridtop(6,6);
vecindad=linkdist(w);

W=som(ratings,w,vecindad,50,0.2);

clase=zeros(1,length(datos));
for i=1:length(datos);
    [~,clase(i)]=min(dist(W', datos(:,i)));
end

close all;
colores=['ob'; 'or'; 'om'; 'og'; 'oy'];
j=0;
figure, plotsom(W',vecindad);hold on;
for i=1:length(clase)
	j=j+1;
		plot(datos(1,find(clase==i)),datos(2,find(clase==i)),colores(j,:));
	if(j==5)
		j=0;
	end
end

%plotpat(puntos,clase,'.');
