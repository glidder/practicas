function []=colores(m1,b1,m2,b2,ri,rs,n)
    if nargin <7
	    n=10000;
    end
    rand('seed',0);
    x=ri+(rs-ri)*rand(1,n);
    y=ri+(rs-ri)*rand(1,n);

    r1=m1*x-y+b1;
    r2=m2*x-y+b2;
    ind2 = find(r1 < 0 & r2 < 0);
    ind3 = find(r1 < 0 & r2 > 0);
    ind4 = find(r1 > 0 & r2 < 0);
    ind5 = find(r1 > 0 & r2 > 0);

    figure; 
    plot(x(ind2), y(ind2), '.r'), hold on;
    plot(x(ind3), y(ind3), '.g'), hold on;
    plot(x(ind4), y(ind4), '.b'), hold on;
    plot(x(ind5), y(ind5), '.y'), hold on;

    plot([ri rs],([ri rs]*m1+b1),'k');
    plot([ri rs],([ri rs]*m2+b2),'k');
    axis([ri rs ri rs]);
end
