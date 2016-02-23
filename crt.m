% Chinese Remainder Theorem
function [x_uint, M_uint] = crt(remainders_uint, modulus_uint)

numOfRem = length(remainders_uint);
numOfMod = length(modulus_uint);

if numOfRem ~= numOfMod
	disp('ERROR: numOfRem ~= numOfMod');
	return;
elseif numOfRem == 1
	disp('ERROR: only one equation');
	return;
end

numOfEquations = numOfMod;
for idx = 1:numOfEquations-1
	for jdx = idx+1:numOfEquations
		if gcd(modulus_uint(idx), modulus_uint(jdx)) ~= 1
			disp('ERROR: gcd(modulus_uint(idx), modulus_uint(jdx)) ~= 1');
			return;
		end
	end
end

M_uint = prod(modulus_uint, 'native');

combRemainder_uint = sum((M_uint ./ modulus_uint) .* remainders_uint, 'native');
combModulus_uint = sum(M_uint ./ modulus_uint, 'native');

% phiN_uint = prod(modulus_uint - 1, 'native');
% phiN_uint = phiFun(modulus_uint);
phiN_uint = phiFun(M_uint);
% phiN_uint = 1854406656;

fastPowerMod(combModulus_uint, phiN_uint, M_uint)

invCombModulus_uint = fastPowerMod(combModulus_uint, phiN_uint-1, M_uint);

% disp(fastMultMod(invCombModulus_uint, combModulus_uint, M_uint))

x_uint = fastMultMod(invCombModulus_uint, combRemainder_uint, M_uint);

end
