% Chinese Remainder Theorem
function [x_uint, M_uint] = crt(remainders_uint, modulus_uint, isModulusValid, auxiMultiplier_uint)

if ~exist('isModulusValid', 'var')
	isModulusValid = true;
end

if ~isModulusValid
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
end

M_uint = prod(modulus_uint, 'native');
combModulus_uint = M_uint ./ modulus_uint;

x_uint = uint64(0);
if ~exist('auxiMultiplier_uint', 'var')
	for idx = 1:length(modulus_uint)
		m_i_uint = modulus_uint(idx);
		combModulus_i_uint = combModulus_uint(idx);
		remainders_i_uint = remainders_uint(idx);

		multInverse_i = fastPowerMod(combModulus_i_uint, phiFun(m_i_uint)-1, m_i_uint);

		toBeAdd = fastMultMod(remainders_i_uint*multInverse_i, combModulus_i_uint, M_uint);
		x_uint = mod(x_uint + toBeAdd, M_uint);
	end
else
	for idx = 1:length(modulus_uint)
		m_i_uint = modulus_uint(idx);
		% combModulus_i_uint = combModulus_uint(idx);
		remainders_i_uint = remainders_uint(idx);
		auxiMultiplier_i_uint = auxiMultiplier_uint(idx);
		% multInverse_i = fastPowerMod(combModulus_i_uint, phiFun(m_i_uint)-1, m_i_uint);

		toBeAdd = fastMultMod(remainders_i_uint, auxiMultiplier_i_uint, M_uint);
		x_uint = mod(x_uint + toBeAdd, M_uint);
	end
end




% combRemainder_uint = sum((M_uint ./ modulus_uint) .* remainders_uint, 'native');
% combModulus_uint = sum(M_uint ./ modulus_uint, 'native');

% phiM_uint = prod(modulus_uint - 1, 'native');
% % phiM_uint = phiFun(modulus_uint);
% % phiM_uint = phiFun(M_uint);
% % phiM_uint = 1854406656;

% % fastPowerMod(combModulus_uint, phiM_uint, M_uint)

% % gcd(combModulus_uint, M_uint)
% % disp('Text');
% % combModulus_uint
% % M_uint
% % disp('Text');

% invCombModulus_uint = fastPowerMod(combModulus_uint, phiM_uint-1, M_uint);

% % disp(fastMultMod(invCombModulus_uint, combModulus_uint, M_uint))

% x_uint = fastMultMod(invCombModulus_uint, combRemainder_uint, M_uint);

end
