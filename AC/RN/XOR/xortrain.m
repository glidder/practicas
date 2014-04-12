function [wa wb wc]= xortrain();
	x=[1 0 0; 1 0 1; 1 1 0; 1 1 1];
	ya=[-1 1 -1 -1];
	yb=[-1 -1 1 -1];
	yc=[-1 1 1 1];
	wa = percetrain(x,ya);
	wb = percetrain(x,yb);
	wc = percetrain(x,yc);
	plot(x(:,2),x(:,3),'or');hold on
	plot(x(:,2),(wa(2)*x(:,2)+wa(1))/-wa(3),'b');
	plot(x(:,2),(wb(2)*x(:,2)+wb(1))/-wb(3),'b');
	axis([-0.5 1.5 -0.5 1.5]);hold off;
end
