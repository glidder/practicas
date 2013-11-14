function sol=frontera_decision(m1, s1, m2, s2)
x=[m1+s1*randn(1,30) m2+s2*randn(1,20)];
y=[ones(1,30) 2*ones(1,20)];
indices1=find(y==1); indices2=find(y==2);
m1=mean(x(indices1)); m2=mean(x(indices2));
s1=std(x(indices1)); s2=std(x(indices2));
Pw1=length(indices1)/length(y);
Pw2=length(indices2)/length(y);
A=s1*s1-s2*s2;
B=2*(m1*s2*s2-m2*s1*s1);
C=2*s1*s1*s2*s2*(log(Pw1)-log(Pw2)-log(s1)+log(s2))+s1*s1*m2*m2-s2*s2*m1*m1;
x1=(-B+sqrt(B*B-4*A*C))/2/A
x2=(-B-sqrt(B*B-4*A*C))/2/A
I=-9:0.01:9;plot(I,Pw1*normpdf(I,m1,s1));hold on;
plot(I,Pw2*normpdf(I,m2,s2),'r');hold off;
end
