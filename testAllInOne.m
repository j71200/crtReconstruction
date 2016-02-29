clear('all');
clc

load('mat/recon_div3_521_523_541.mat');
originalImage_uint = recon_airplane_uint;
reconLength = length(originalImage_uint);
extendHeight = ceil(sqrt(reconLength));
extendWidth = extendHeight;
extendImage_uint = zeros(extendHeight, extendWidth, 'uint64');
extendImage_uint(1:reconLength) = originalImage_uint;
extendImage_uint = reshape(extendImage_uint, [extendHeight, extendWidth]);

%1 - Shift down without Crop
%2 - Shift right without Crop
%3 - Rotate without Crop
%4 - Scale without Crop
%5 - Shearing in x without Crop
%6 - Shearing in y without Crop
%7 - Shearing in x&y without Crop
%8 - JPEG Compression
%9 - JPEG Compression and Rotatation
attackType = 1;
isShowProcess = true;

[wmSignature, wmSignature_reg] = allInOne(originalImage_uint, attackType, isShowProcess);



