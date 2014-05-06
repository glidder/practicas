function w = func_base_radial(k)
	 close all;
	NUMPOINTS=30;
	x = 4*(rand(1,NUMPOINTS)-0.5);
	x = sort(x);
	
	yok = 1.8*tanh(3.2*x + 0.8)- 2.5*tanh(2.1*x + 1.2)-0.2*tanh(0.1*x - 0.5);
	RUIDO = 0.2*std(yok);
	yruido = RUIDO*randn(size(yok));
	y= yok + yruido;
	
	centros=linspace(min(x),max(x),k);
	%yc= 1.8*tanh(3.2*centros + 0.8)- 2.5*tanh(2.1*centros + 1.2)-0.2*tanh(0.1*centros - 0.5);
	sigma=(centros(end)-centros(1))/sqrt(2*k);
	msigma=zeros(NUMPOINTS,k+1);
	msigma(:,1)=1;
	for i=1:k%length(centros)
		msigma(i,2:NUMPOINTS+1)= normpdf(x,centros(i),sigma);
	end
	w=pinv(msigma)*y';
	
	plot(x,y,'ko'),hold on;
	h=w'*msigma';
	plot(x,h), hold on;
	%plot(x,msigma(15,:),'g'), hold on;
	%x2= -2:0.1:2;
	%for i=1:length(x)
	%	phi_2(i,:)=normpdf(x2,x(i),sigma);
	%end
	%y2=w'*phi_2;
	%plot(x2,y2,'r');
end
