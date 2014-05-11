clear all, close all
NUMPOINTS=1000;
x=4*(rand(1,NUMPOINTS)-0.5);
yok = 1.8*tanh(3.2*x + 0.8)- 2.5*tanh(2.1*x + 1.2)- 0.2*tanh(0.1*x - 0.5);

RUIDO = 0.2*std(yok);
yruido = RUIDO*randn(size(yok));
y= yok + yruido;

NUMDATA=50;
xtrain=4*(rand(1,NUMDATA)-0.5);
ytrain= 1.8*tanh(3.2*xtrain + 0.8)- 2.5*tanh(2.1*xtrain + 1.2)- 0.2*tanh(0.1*xtrain - 0.5);

plot(xtrain,ytrain,'o')
error=zeros(1,7);
for i=3:10
net=newff(minmax(xtrain),[i 1],{'tansig' 'purelin'},'trainlm');

net.trainParam.showWindow=0;
net.trainParam.epochs=300;
net.trainParam.goal=0.01;

net=train(net,xtrain,ytrain);
y2=sim(net,xtrain);

plot(xtrain,ytrain,'o'),hold on, plot(xtrain,y2,'xr')

[y3]=sim(net,x);
figure, plot(xtrain,ytrain,'or'),hold on, plot(x,yok,'.k'), plot(x,y3,'xr');
%figure
error(i - 2) = sum((y-y3).^2)/length(y);
%ploterrhist(error') 
end
hold off;
figure, plot(error,'r');

