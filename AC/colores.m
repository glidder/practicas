function []=colores(a1,b1,a2,b2,ri,rs,n)
if nargin <7
	n=10000;
end
rand('seed',0);
%0=Ax+By+C;
x=ri+(rs-ri)*rand(1,n);
y=ri+(rs-ri)*rand(1,n);
c=zeros(1,n);
for(i=1:n)
	if(a1*x(i)-y(i)+b1>0)
		if(a2*x(i)-y(i)+b2>0)
			c(i)=1;
		else
			c(i)=2;
		end
	elseif(a2*x(i)-y(i)+b2>0)
			c(i)=3;
	end
end
figure; 

ind=find(c==0);
plot(x(ind),y(ind),'or'); hold on
ind=find(c==1);
plot(x(ind),y(ind),'og');
ind=find(c==2);
plot(x(ind),y(ind),'ob');
ind=find(c==3);
plot(x(ind),y(ind),'oy');

plot([ri rs],([ri rs]*a1+b1),'k');
plot([ri rs],([ri rs]*a2+b2),'k');
axis([ri rs ri rs]);
end
