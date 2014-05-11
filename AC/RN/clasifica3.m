clear all
close all
load datos2.mat

nclass=zeros(3,size(class));
nclass(1,find(class==1))=1;
nclass(2,find(class==2))=1;
nclass(3,find(class==3))=1;

for i=3:10
net=newff(minmax(x),[i 3],{'tansig' 'logsig'},'trainlm');

net.trainParam.showWindow=0;
net.trainParam.epochs=300;
net.trainParam.goal=0.01;

net=train(net,x,nclass);

NUMPOINTS=1000;
x2=[6*rand(1,NUMPOINTS)-2;rand(1,NUMPOINTS)];
y2=sim(net,x2);

figure, plot(x2(1,find(y2(1,:)>y2(2,:)&y2(1,:)>y2(3,:))),x2(2,find(y2(1,:)>y2(2,:)&y2(1,:)>y2(3,:))),'.m'),hold on
plot(x2(1,find(y2(2,:)>y2(1,:)&y2(2,:)>y2(3,:))),x2(2,find(y2(2,:)>y2(1,:)&y2(2,:)>y2(3,:))),'.g')
plot(x2(1,find(y2(3,:)>y2(1,:)&y2(3,:)>y2(2,:))),x2(2,find(y2(3,:)>y2(1,:)&y2(3,:)>y2(2,:))),'.y')

plot(x(1,find(class==1)),x(2,find(class==1)),'<r','MarkerFaceColor','r','MarkerEdgeColor','k'),
plot(x(1,find(class==2)),x(2,find(class==2)),'>b','MarkerFaceColor','b','MarkerEdgeColor','k'),
plot(x(1,find(class==3)),x(2,find(class==3)),'>y','MarkerFaceColor','y','MarkerEdgeColor','k'), hold off
end
