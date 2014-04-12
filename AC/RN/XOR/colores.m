function []=colores(w1,w2,ri,rs,n)
	m1=w1(2);
	b1=w1(1);
	m2=w2(2);
	b2=w2(1);
    if nargin <5
	    n=10000;
    end
    rand('seed',0);
    x=ri+(rs-ri)*rand(1,n);
    y=ri+(rs-ri)*rand(1,n);

    r1=m1*x+y*w1(3)+b1;
    r2=m2*x+y*w2(3)+b2;
    ind2 = find(r1 > 0 & r2 < 0 | r1 < 0 & r2 > 0);
    ind3 = find(r1 > 0 & r2 > 0 | r1 < 0 & r2 < 0);

    figure; 
    plot(x(ind2), y(ind2), '.y'), hold on;
    plot(x(ind3), y(ind3), '.g');

   	plot([ri rs],(w1(2)*[ri rs]+w1(1))/-w1(3),'k');
	plot([ri rs],(w2(2)*[ri rs]+w2(1))/-w2(3),'k');
    plot([0 0 1 1],[0 1 0 1],'dr','MarkerEdgeColor','k','MarkerFaceColor','r', 'MarkerSize',10);
    axis([ri rs ri rs]);hold off;
end
