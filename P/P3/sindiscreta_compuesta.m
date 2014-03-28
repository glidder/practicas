function [xt,yt] = sindiscreta_compuesta(N, Fs, A, F, Fase)
xt=0;yt=0;
for i=1:length(A)
	[x,y]=sindiscreta(N, Fs, A(i), F(i), Fase(i));
	xt=xt+x;
	yt=yt+y;
	plot(xt,yt,'ob');
end
end
