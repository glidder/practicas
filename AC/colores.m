function []=colores(a1,b1,c1,a2,b2,c2)
randn('seed',0);
%0=Ax+By+C;
x=randn(1,1000);
y=randn(1,1000);
c=zeros(1,1000);
for(i=1:1000)
	if(a1*x(i)+b1*y(i)+c1>0)
		if(a2*x(i)+b2*y(i)+c2>0)
			c(i)=1;
		else
			c(i)=2;
		end
	else if(a2*x(i)+b2*y(i)+c2>0)
			c(i)=3;
	end
end
c
figure; 
ind=find(c==0);
%plot(x(ind),y(ind),'or'); hold on
ind=find(c==1);
%plot(x(ind),y(ind),'og');
ind=find(c==2);
%plot(x(ind),y(ind),'ob');
ind=find(c==3);
%plot(x(ind),y(ind),'oy');
end
