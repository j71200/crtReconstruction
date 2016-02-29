close all
clear
clc

load('mat/recon_div3_521_523_541.mat');


normHeight = 512;
normWidth = 512;

wmSize = 50; % 8KB
watermark = randi([0, 1], wmSize, 1);
% patternSize = 64 * 64; % 必須大於大於 wmSize才行
patternSize = 256 * 256; % 必須大於大於 wmSize才行
% patternSize = 400 * 400; % 必須大於大於 wmSize才行
patterns = sign(randn(patternSize, wmSize));


wmSignature1 = patterns * (2*watermark - 1);

% Step 2-(c)
[zigzagColMajor ~] = genaralZigzag(normHeight, normWidth);
wmSignature2 = zeros(normHeight, normWidth);
imageArea = length(zigzagColMajor);
middle_band_idx = zigzagColMajor(1+3*imageArea/8:3*imageArea/8 + patternSize);
wmSignature2(middle_band_idx) = wmSignature1;

% Step 2-(d)
wmSignature2_idct = idct2(wmSignature2);


wmSignature2_idct_trick = round(wmSignature2_idct);
trickShift = min(min(wmSignature2_idct_trick));
wmSignature2_idct_trick_uint = wmSignature2_idct_trick - trickShift + 1;
wmSignature2_idct_trick_uint = uint64(wmSignature2_idct_trick_uint);

tic
reconWmSignature2_idct_trick_uint = crtReconstruct(wmSignature2_idct_trick_uint, coprimeNums_uint);
toc


% divisor = 3; % M_uint = 

% %    for 11.30sec
% % parfor  6.21sec


% height = 512;
% width  = 512;

% % inputImage_uint = uint64(randi([0,255], height, width));
% % tic
% % recon_data_uint = crtReconstruct(inputImage_uint, divisor);
% % toc

% inputImage_uint = uint64(inputImage);


% disp('recon_airplane_uint');
% inputImage = imread('images/airplane_gray.png');
% inputImage_uint = uint64(inputImage);
% tic
% recon_airplane_uint = crtReconstruct(inputImage_uint, divisor);
% airplaneTime = toc

% disp('recon_baboon_uint');
% inputImage = imread('images/baboon_gray.png');
% inputImage_uint = uint64(inputImage);
% tic
% recon_baboon_uint = crtReconstruct(inputImage_uint, divisor);
% baboonTime = toc

% disp('recon_fruits_uint');
% inputImage = imread('images/fruits_gray.png');
% inputImage_uint = uint64(inputImage);
% tic
% recon_fruits_uint = crtReconstruct(inputImage_uint, divisor);
% fruitsTime = toc

% disp('recon_lena_uint');
% inputImage = imread('images/lena_gray.png');
% inputImage_uint = uint64(inputImage);
% tic
% recon_lena_uint = crtReconstruct(inputImage_uint, divisor);
% lenaTime = toc

% disp('recon_peppers_uint');
% inputImage = imread('images/peppers_gray.png');
% inputImage_uint = uint64(inputImage);
% tic
% recon_peppers_uint = crtReconstruct(inputImage_uint, divisor);
% peppersTime = toc


% save('mat/reconstructedImages_div3.mat')


% height = 64;
% width  = 64;
% inputImage_uint = uint64(randi([0,255], height, width));






% % groupNum = ceil(height * width / divisor);
% % reconDataMatrix_uint = zeros(height, width, 'uint64');
% % for groupIdx = 1:groupNum
% % 	reconDataMatrix_uint( (groupIdx-1) * divisor + 1 ) = reconData_uint(groupIdx);
% % end

% invReconData_uint = crtInvReconstruct(recon_data_uint, divisor, height, width);

% aa = double(inputImage_uint);
% bb = double(invReconData_uint);
% % cc = reconDataMatrix_uint;

% figure
% spy(abs(aa-bb))


