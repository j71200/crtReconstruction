close all
clear
clc


originalImage_uint = uint64(0);


% =================
% KeyGen
% =================
p_uint = uint64(65519);
q_uint = uint64(65521);
r_uint = 3;

[n_uint, g_uint, lambda_uint, mu_uint] = paillierKeygen(p_uint, q_uint);
nSquare_uint = n_uint^2;

% ==========================
% Encrypt Image
% ==========================
encryptedImg_uint = paillierEncrypt(originalImage_uint, n_uint, g_uint, r_uint);


% ==========================
% Decrypt Image
% ==========================
recM_uint = paillierDecrypt(encryptedImg_uint, n_uint, lambda_uint, mu_uint)






% [imgSum, imgMax, imgMin, imgNNZ, accVector1] = statImage(encryptedImg_uint);
% figure;
% plot(accVector1, 'b');





% attackedImage = imrotate(originalImage, 30);
% attackedImage_uint = uint64(attackedImage);

% occIdx = find(attackedImage_uint);
% attackedImage_uint(occIdx) = attackedImage_uint(occIdx)+1;

% encryptedAttImage_uint = paillierEncrypt(attackedImage_uint, n_uint, g_uint, r_uint);

% [imgSum, imgMax, imgMin, imgNNZ, accVector2] = statImage(encryptedAttImage_uint);

% hold on
% plot(accVector2(2:end), 'r')









