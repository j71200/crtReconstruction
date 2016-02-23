close all
clear
clc

% inputImage = imread('./lena_gray.png');
% inputImage_uint = uint64(inputImage);

height = 16;
width  = 16;
inputImage_uint = uint64(randi([0,255], height, width));

divisor = 4;

tic
reconData_uint = crtReconstruct(inputImage_uint, divisor);
toc

groupNum = ceil(height * width / divisor);
reconDataMatrix_uint = zeros(height, width, 'uint64');
for groupIdx = 1:groupNum
	reconDataMatrix_uint( (groupIdx-1) * divisor + 1 ) = reconData_uint(groupIdx);
end

tic
invReconData_uint = crtInvReconstruct(reconData_uint, divisor, height, width);
toc

aa = double(inputImage_uint);
bb = double(invReconData_uint);
cc = reconDataMatrix_uint;

figure
spy(abs(aa-bb))


