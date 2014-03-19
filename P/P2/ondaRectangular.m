function[x,y_acum]=ondaRectangular(A,F,Fase,Fs,n_muestras,n_sum,pintar,retardo)
n=0:n_muestras -1;
x=n*1/Fs;
y_acum=zeros(1,length(x));
f=F/Fs;
w=2*pi*f;
for i=1:n_sum
	y=((4*A/pi)*(1/(2*i-1))*sin((2*i-1)*2*pi*f*n+Fase));
	y_acum=y_acum+y;
end
end
