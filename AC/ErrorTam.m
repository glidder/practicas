clear all, close all
NUMPOINTS=1000;
x = 4*(rand(1,NUMPOINTS)-0.5);
yok =  9*x+12*x.^2+4*x.^3+5*x.^4+23*x.^5;
RUIDO = 0.1*std(yok);
yruido = RUIDO*randn(size(yok));
y= yok + yruido;

EG=zeros(1,50);
ECM=zeros(1,50);
for NUMDATA=1:50
	for i=1:1000
		xdata = 4*(rand(1,NUMDATA)-0.5);
		ydata = 9*xdata+12*xdata.^2+4*xdata.^3+5*xdata.^4+23*xdata.^5 + RUIDO*randn(size(xdata));
		p=polyfit(xdata,ydata,5); 
		ECM(NUMDATA)=ECM(NUMDATA)+sum((ydata-polyval(p,xdata)).^2)/length(ydata);
		xeg=4*(rand(1,NUMDATA)-0.5);
		yeg= 9*xeg+12*xeg.^2+4*xeg.^3+5*xeg.^4+23*xeg.^5 + RUIDO*randn(size(xeg));
		EG(NUMDATA)=EG(NUMDATA)+sum((yeg-polyval(p,xeg)).^2)/length(yeg);
	end
end
EG=EG/1000;
ECM=ECM/1000;
figure, plot(log(EG),'b');hold on; plot(log(ECM),'r'); legend('EG','ECM'); hold off;


