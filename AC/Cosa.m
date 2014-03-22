clear all, close all
NUMPOINTS=1000;
x = 4*(rand(1,NUMPOINTS)-0.5);
yok = 9*x+12*x.^2+49*x.^3+5*x.^4+23*x.^5;
RUIDO = 0.2*std(yok);
yruido = RUIDO*randn(size(yok));
y= yok + yruido;
%figure, plot(x,y,'.b'); hold,plot(x,yok,'.k'); drawnow;

for j=1:50
NUMDATA=20;
xdata = 4*(rand(1,NUMDATA)-0.5);
ydata = 9*xdata+12*xdata.^2+49*xdata.^3+5*xdata.^4+23*xdata.^5; + RUIDO*randn(size(xdata));
%figure, plot(xdata,ydata,'og'); hold on, plot(x,yok,'.b'); drawnow;
% minimizar la funcion E=(Y-BX)^2 ===> X'Y=X'BX ==> B=inv(X'X)XY= pinv(X)Y
X=[ones(1,NUMDATA);xdata;xdata.^2;xdata.^3;xdata.^4;xdata.^5]';
B=pinv(X)*ydata';
ynew=X*B;
%plot(xdata,ynew,'ok')
for(i=1:8)
%figure, plot(xdata,ydata,'og'); hold on, plot(x,yok,'.b'); drawnow;
p=polyfit(xdata,ydata,i); 
%plot(xdata,polyval(p,xdata),'.k')
%plot(x,polyval(p,x),'.r')
ECM(i)=sum((ydata-polyval(p,xdata)).^2)/length(ydata);
%xeg=4*(rand(1,NUMDATA)-0.5);
%yeg= 9*xeg+12*xeg.^2+49*xeg.^3+5*xeg.^4+23*xeg.^5 + RUIDO*randn(size(xeg));
xeg=x;
yeg=y;
EG(i)=sum((xeg-polyval(p,xeg)).^2)/length(yeg);
end
EGt(j,:)=EG; 
ECMt(j,:)=ECM;
end
figure, boxplot(log(EGt));legend('EG');
figure, boxplot(log(ECMt)); legend('ECM');
