function w= percetrain(x,y)
w=zeros(1,3);
rep=0;
while rep<length(y)
	rep=0;
	for i=1:length(y)
		aux=hardlim(sum(w.*x(i,:)));
		err=y(i)-aux;
		waux=w+x(i,:)*err;
		if waux==w
			rep=rep+1;
		end
		w=waux;
	end
end
plot(x(:,2),x(:,3),'or');hold on
plot(x(:,2),(w(2)*x(:,2)+w(1))/-w(3),'b');hold off;
end
