close all
clear
clc

divisor = 4; % M_uint = 


% height = 32;
% width  = 32;
% inputImage_uint = uint64(randi([0,255], height, width));
disp('recon_airplane_uint');
inputImage = imread('images/airplane_gray.png');
inputImage_uint = uint64(inputImage);
tic
recon_airplane_uint = crtReconstruct(inputImage_uint, divisor);
toc

disp('recon_baboon_uint');
inputImage = imread('images/baboon_gray.png');
inputImage_uint = uint64(inputImage);
tic
recon_baboon_uint = crtReconstruct(inputImage_uint, divisor);
toc

disp('recon_fruits_uint');
inputImage = imread('images/fruits_gray.png');
inputImage_uint = uint64(inputImage);
tic
recon_fruits_uint = crtReconstruct(inputImage_uint, divisor);
toc

disp('recon_lena_uint');
inputImage = imread('images/lena_gray.png');
inputImage_uint = uint64(inputImage);
tic
recon_lena_uint = crtReconstruct(inputImage_uint, divisor);
toc

disp('recon_peppers_uint');
inputImage = imread('images/peppers_gray.png');
inputImage_uint = uint64(inputImage);
tic
recon_peppers_uint = crtReconstruct(inputImage_uint, divisor);
toc




% height = 64;
% width  = 64;
% inputImage_uint = uint64(randi([0,255], height, width));






% % groupNum = ceil(height * width / divisor);
% % reconDataMatrix_uint = zeros(height, width, 'uint64');
% % for groupIdx = 1:groupNum
% % 	reconDataMatrix_uint( (groupIdx-1) * divisor + 1 ) = reconData_uint(groupIdx);
% % end


% invReconData_uint = crtInvReconstruct(recon_airplane_uint, divisor, height, width);


% aa = double(inputImage_uint);
% bb = double(invReconData_uint);
% % cc = reconDataMatrix_uint;

% figure
% spy(abs(aa-bb))


