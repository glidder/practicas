function y=xorval(w1,w2,w3,x)
	if perceval(w1,x)==-1
		i=0;
	else
		i=1;
	end
	if perceval(w2,x)==-1
		j=0;
	else
		j=1;
	end
	y=perceval(w3,[1 i j]);
end
