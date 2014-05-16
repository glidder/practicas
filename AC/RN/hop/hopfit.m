function w=hopfit(e)
	w=e'*e-size(e,1)*eye(size(e,2));
end
