function w=bamfit(x,y)
	%w=e'*e-size(e,1)*eye(size(e,2));
	w=(x'*y)./size(x,1);
end
