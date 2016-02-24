% Paillier
% function [c_uint, recM] = testPaillier(m)
clear
clc
m = 9;

m_uint = uint64(m);

% =================
% key gen
% =================
% p = 17;
% q = 19;


% p = uint64(277);
% q = uint64(281);

% p = uint64(181);
% q = uint64(191);

% p = uint64(373);
% q = uint64(379);

% p = uint64(1667);
% q = uint64(1669);

p = uint64(251);
q = uint64(257);


phi_uint = (p-1) * (q-1);
n_uint = p * q
nSquare_uint = n_uint^2

g_uint = n_uint + 1;
lambda_uint = phi_uint;
mu_uint = fastPowerMod(phi_uint, phi_uint-1, n_uint);  % 49748


% =================
% Encrypt
% =================
% m = 1;
r = uint64(3);

c_uint = fastMultMod(fastPowerMod(g_uint, m_uint, nSquare_uint), fastPowerMod(r, n_uint, nSquare_uint), nSquare_uint);  % 3139926596

% c_uint = fastPowerMod(g_uint, m_uint, nSquare_uint) * fastPowerMod(r, n_uint, nSquare_uint);
% c_uint = mod(c_uint, nSquare_uint);





% =================
% Decrypt
% =================
recU_uint = fastPowerMod(c_uint, lambda_uint, nSquare_uint);  % 3866807609

temp_recU_uint = recU_uint - 1;
temp_recU_uint = temp_recU_uint - mod(temp_recU_uint, n_uint);
recL_uint = temp_recU_uint / n_uint;  % 59944


recM = fastMultMod(recL_uint, mu_uint, n_uint);


% end





