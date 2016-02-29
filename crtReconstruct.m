function reconData_uint = crtReconstruct(grayImage_uint, coprimeNums_uint)

divisor = length(coprimeNums_uint);

[height, width] = size(grayImage_uint);
totalPixelNum = height * width;
groupNum = ceil(totalPixelNum / divisor);
reconData_uint = zeros(groupNum, 1, 'uint64');

M_uint = prod(coprimeNums_uint, 'native');


% step = groupNum / 50;
% nextTarget = step;

combModulus_uint = M_uint ./ coprimeNums_uint;
auxiMultiplier_uint = zeros(divisor, 1, 'uint64');
for idx = 1:divisor
	m_i_uint = coprimeNums_uint(idx);
	combModulus_i_uint = combModulus_uint(idx);
	multInverse_i = fastPowerMod(combModulus_i_uint, phiFun(m_i_uint)-1, m_i_uint);
	auxiMultiplier_uint(idx) = fastMultMod(combModulus_i_uint, multInverse_i, M_uint);
end
% auxiMultiplier_uint

parfor groupIdx = 1:(groupNum-1)
% for groupIdx = 1:(groupNum-1)
	% if groupIdx > nextTarget
	% 	disp([num2str(round(100*groupIdx/groupNum)) '%']);
	% 	nextTarget = nextTarget + step;
	% end

	groupStartIdx = (groupIdx-1) * divisor + 1;
	groupEndIdx = groupStartIdx + divisor - 1;
	groupPixels_uint = grayImage_uint(groupStartIdx:groupEndIdx)';
	[reconData_uint(groupIdx), ~] = crt(groupPixels_uint, coprimeNums_uint, false, auxiMultiplier_uint);
end

groupStartIdx = (groupNum-1) * divisor + 1;
groupPixels_uint = zeros(divisor, 1, 'uint64');
groupPixels_uint(1:totalPixelNum-groupStartIdx+1) = grayImage_uint(groupStartIdx:end);


[reconData_uint(groupNum), ~] = crt(groupPixels_uint, coprimeNums_uint, false, auxiMultiplier_uint);

end
