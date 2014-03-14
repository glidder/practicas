function [x, n]=rampa(n0, n1, n2, pintar)
	if nargin < 4
		pintar=0;
	end
	
	n = n1:n2;
	x=n-n0;
	x(n<n0)=0;

	if pintar == 1
		stem(n, x);
	end
end
