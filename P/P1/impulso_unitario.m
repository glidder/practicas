function [x, n]=impulso_unitario(n0, n1, n2, pintar)
	if nargin < 4
		pintar=0;
	end

	n = n1:n2;
	x = zeros(1, n2-n1+1);
	x(n == n0) = 1;

	if pintar == 1
		stem(n, x);
	end
	
end
