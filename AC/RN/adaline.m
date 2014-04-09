function w=adaline(x,sd,a,em)
w=randi(9,[1 size(x,2)])
err=em+1;
while err>em
	rep=0;
	for i=1:length(sd)
		so=sum(sum(x(i,:).*w));
		err=sd(i)-so;
		waux=w+x(i,:)*(a*err);
		w=waux;
	end
end
plot(x(:,2),x(:,3),'or');hold on
plot(x(:,2),(w(2)*x(:,2)+w(1))/-w(3),'b');hold off;
end
