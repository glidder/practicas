%Luis José Quintana Bolaño
%Practica 7 MC
%Ejercicio 1
rand('seed',0);
randn('seed',0);
clase1=randnorm([0; 0], [1 0.8;0.8 2], 1000);
clase2=randnorm([3; 3], [1 -0.9; -0.9 2], 1000);
mC1=mean(clase1');
mC2=mean(clase2');
CC=shuffle([clase1 clase2]);

%a)
CfinalEuclidea=zeros(1, 1600);
for i=1:1600
	aux1=sqrt((mC1(1)-CC(1,i))^2+(mC1(2)-CC(2,i))^2);
	aux2=sqrt((mC2(1)-CC(1,i))^2+(mC2(2)-CC(2,i))^2);
	[x y]=min([aux1 aux2]);
	CfinalEuclidea(i)=y;
	%if y == 1
	%	CfinalEuclidea(i)=1;
	%else
	%	CfinalEuclidea(i)=2;
	%end
end
CfinalEuclidea

%b)
CfinalMahalanois=zeros(1, 1600);
for i=1:1600
	aux1=CC(:,i)'*inv([1 0.8;0.8 2])*mC1';
	aux2=CC(:,i)'*inv([1 -0.9; -0.9 2])*mC2';
	[x y]=min([aux1 aux2]);
	CfinalMahalanois(i)=y;
end
CfinalMahalanois

%c)
y=[ones(1,1000) zeros(1,1000)];
plotpat([clase1 clase2],y);
hold on
plotbon([0;0],[1 0.8;0.8 2],[3;3],[1 -0.9; -0.9 2],'b');
axis([-4 6 -4 6])

