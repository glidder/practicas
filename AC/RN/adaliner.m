function w=adaliner(x,sd,a,em) 
w=randi(9,[1 size(x,2)])
err=em+1; 
rep = 0; 
rep=0; 
i=1;
errant=0;
while abs(err-errant)>em && rep<1000
    
        so=x(i,:)*w'; 
        errant=err;
        err=sd(i)-so; 
        waux=w+x(i,:)*(a*err); 
        w=waux; 
        i = mod(i,size(x,1))+1;
        rep=rep+1;
end 
plot(x(:,2),x(:,3),'or');hold on 
plot(x(:,2),(w(2)*x(:,2)+w(1))/-w(3),'b');hold off; 
end

