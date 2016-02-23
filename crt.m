% Chinese Remainder Theorem
function [x_uint, N_uint] = crt(remainders_uint, modulus_uint)

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

N_uint = prod(modulus_uint, 'native');

combRemainder_uint = sum((N_uint ./ modulus_uint) .* remainders_uint, 'native');
combModulus_uint = sum(N_uint ./ modulus_uint, 'native');

% phiN_uint = uint64(1854406656);

% 4412666879
phiN_uint = prod(modulus_uint-1, 'native')

% disp('============');
% res_uint = fastPowerMod(base_uint, power_uint, modNum_uint)
% disp('============');

invCombModulus_uint = fastPowerMod(combModulus_uint, phiN_uint-1, N_uint);

mod(invCombModulus_uint * combModulus_uint, N_uint)

x_uint = mod(invCombModulus_uint * combRemainder_uint, N_uint);

end
