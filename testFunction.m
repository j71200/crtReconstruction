function res = testFunction(a, b, c)
	if exist('c', 'var')
		res = mod(a*b, c);
	else
		res = a * b;
	end
end