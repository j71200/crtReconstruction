function invReconData_uint = crtInvReconstruct(reconData_uint, coprimeNums_uint, height, width)

divisor = length(coprimeNums_uint);

grayImage_uint = zeros(height, width, 'uint64');

totalPixelNum = height * width;
groupNum = ceil(totalPixelNum / divisor);
invReconData_uint = zeros(height, width, 'uint64');

for groupIdx = 1:(groupNum-1)
	x_uint = reconData_uint(groupIdx) * (zeros(divisor, 1, 'uint64') + 1);

	groupStartIdx = (groupIdx-1) * divisor + 1;
	groupEndIdx = groupStartIdx + divisor - 1;
	invReconData_uint(groupStartIdx:groupEndIdx) = mod(x_uint, coprimeNums_uint);
end

remainPixelNum = height*width-(groupNum-1)*divisor;

x_uint = reconData_uint(groupNum) * (zeros(remainPixelNum, 1, 'uint64') + 1);

groupStartIdx = (groupNum-1) * divisor + 1;

invReconData_uint(groupStartIdx:end) = mod(x_uint, coprimeNums_uint(1:remainPixelNum));


end
