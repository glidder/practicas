clear all
close all
load datos1.mat
plot(x(1,find(class==1)),x(2,find(class==1)),'or'), hold on
plot(x(1,find(class==2)),x(2,find(class==2)),'ob'), hold off

nclass=zeros(2,size(class));
nclass(1,find(class==1))=1;
nclass(2,find(class==2))=1;

net=newff(minmax(x),[5 2],{'tansig' 'logsig'},'trainlm');

net.trainParam.showWindow=0;
net.trainParam.epochs=300;
net.trainParam.goal=0.01;

net=train(net,x,nclass);

NUMPOINTS=1000;
x2=[2*(rand(1,NUMPOINTS));2*(rand(1,NUMPOINTS))];
y2=sim(net,x2)

plot(x2(1,find(y2(1,:)>y2(2,:))),x2(2,find(y2(1,:)>y2(2,:))),'.r'),hold on
plot(x2(1,find(y2(1,:)<=y2(2,:))),x2(2,find(y2(1,:)<=y2(2,:))),'.b')
plot(x(1,find(class==1)),x(2,find(class==1)),'<m','MarkerFaceColor','m','MarkerEdgeColor','k'),
plot(x(1,find(class==2)),x(2,find(class==2)),'>g','MarkerFaceColor','g','MarkerEdgeColor','k'), hold off
