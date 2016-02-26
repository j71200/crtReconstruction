function [decryptedText_uint] = paillierDecrypt(c_uint, n_uint, lambda_uint, mu_uint)

if nnz(c_uint > n_uint^2) > 0
	disp('Error, c_uint > n_uint^2');
	ERROR = HERE;

elseif nnz(c_uint < 0) > 0
	disp('Message include negative integer');
	ERROR = HERE;

elseif nnz(c_uint == 0) > 0
	occupiedIndex = find(c_uint);
	occupiedC_uint = c_uint(occupiedIndex);

	nSquare_uint = n_uint^2;
	recU_uint = fastPowerMod(occupiedC_uint, lambda_uint, nSquare_uint);
	recL_uint = uint64(floor(double(recU_uint-1) / double(n_uint)));
	recM_uint = mod(recL_uint * mu_uint, n_uint);

	decryptedText_uint = uint64(zeros(size(c_uint)));
	decryptedText_uint(occupiedIndex) = recM_uint;

else
	nSquare_uint = n_uint^2;
	recU_uint = fastPowerMod(c_uint, lambda_uint, nSquare_uint);
	recL_uint = uint64(floor(double(recU_uint-1) / double(n_uint)));
	recM_uint = mod(recL_uint * mu_uint, n_uint);

	decryptedText_uint = recM_uint;
end

end