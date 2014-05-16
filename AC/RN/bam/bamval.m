function y1=bamval(w,x)
	y0=ones(1,length(x));
	y1=zeros(1,length(x));
	x0=x;
	while(y0~=y1)
		y0=y1;
		y1=x0*w;
		x0=y1*w';
		y1=y1./abs(y1);
		x0=x0./abs(x0);
	end
end

