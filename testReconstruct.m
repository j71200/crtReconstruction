close all
clear
clc


coprimeNums_uint = uint64([521, 523, 541]);
divisor = length(coprimeNums_uint);

% divisor = 3; % M_uint = 

%    for 11.30sec
% parfor  6.21sec


% height = 8;
% width  = 8;
% inputImage_uint = uint64(randi([0,255], height, width));
% tic
% recon_data_uint = crtReconstruct(inputImage_uint, divisor);
% toc

% inputImage2_uint = uint64(randi([0,20], height, width));
% tic
% recon_data2_uint = crtReconstruct(inputImage2_uint, divisor);
% toc

% recon_data3_uint = recon_data_uint + recon_data2_uint;

% invReconData_uint = crtInvReconstruct(recon_data3_uint, divisor, height, width);

% % aa = mod(double(inputImage_uint+inputImage2_uint), 256)
% aa = double(inputImage_uint+inputImage2_uint)
% bb = double(invReconData_uint)
% figure
% spy(aa-bb)

% cc = double(inputImage_uint);
% dd = double(inputImage2_uint);



disp('recon_airplane_uint');
inputImage = imread('images/airplane_gray.png');
inputImage_uint = uint64(inputImage);
tic
recon_airplane_uint = crtReconstruct(inputImage_uint, coprimeNums_uint);
airplaneTime = toc

disp('recon_baboon_uint');
inputImage = imread('images/baboon_gray.png');
inputImage_uint = uint64(inputImage);
tic
recon_baboon_uint = crtReconstruct(inputImage_uint, coprimeNums_uint);
baboonTime = toc

disp('recon_fruits_uint');
inputImage = imread('images/fruits_gray.png');
inputImage_uint = uint64(inputImage);
tic
recon_fruits_uint = crtReconstruct(inputImage_uint, coprimeNums_uint);
fruitsTime = toc

disp('recon_lena_uint');
inputImage = imread('images/lena_gray.png');
inputImage_uint = uint64(inputImage);
tic
recon_lena_uint = crtReconstruct(inputImage_uint, coprimeNums_uint);
lenaTime = toc

disp('recon_peppers_uint');
inputImage = imread('images/peppers_gray.png');
inputImage_uint = uint64(inputImage);
tic
recon_peppers_uint = crtReconstruct(inputImage_uint, coprimeNums_uint);
peppersTime = toc


save('mat/recon_div3_521_523_541.mat')


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


