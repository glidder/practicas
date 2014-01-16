function [a]=ALCP()
	a = newfis('landingControl')
	
	a=addvar(a,'input', 'height', [0 1000]);
	a=addmf(a, 'input', 1, 'L', 'trimf', [500, 1000, 1500]);
	a=addmf(a, 'input', 1, 'M', 'trimf', [300, 800, 1200]);
	a=addmf(a, 'input', 1, 'S', 'trimf', [-200, 300, 800]);
	a=addmf(a, 'input', 1, 'NZ', 'trimf', [-500, 0, 500]);
	
	a = addvar(a,'input','velocity',[-30 30]);
	a = addmf(a, 'input', 2, 'DL', 'trapmf', [-40 -30 -20 -10])
	a = addmf(a, 'input', 2, 'DS', 'trimf', [-20 -10 0])
	a = addmf(a, 'input', 2, 'Z', 'trimf', [-10 0 10])
	a = addmf(a, 'input', 2, 'US', 'trimf', [0 10 20])
	a = addmf(a, 'input', 2, 'UL', 'trimf', [10 20 30])

	a = addvar(a,'output','controlForce',[-30 30]);
	a = addmf(a, 'output', 1, 'DL', 'trapmf', [-40 -30 -20 -10])
	a = addmf(a, 'output', 1, 'DS', 'trimf', [-20 -10 0])
	a = addmf(a, 'output', 1, 'Z', 'trimf', [-10 0 10])
	a = addmf(a, 'output', 1, 'US', 'trimf', [0 10 20])
	a = addmf(a, 'output', 1, 'UL', 'trimf', [10 20 30])

	FAM = [3 2 1 1 1; 4 3 2 1 1; 5 4 3 2 1; 5 5 3 2 2];
	ruleList = ones(20, 5);
	cont = 1;
	for i = 1 : 4
		for j = 1 : 5
				ruleList(cont, :) = [i, j, FAM(i, j), 1, 1]
				cont = cont + 1;
		end
	end

	a = addrule(a, ruleList);
end
