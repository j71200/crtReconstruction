% Paillier
% function [c_uint, recM] = testJavaPaillier(m_uint)
clear
clc
m_uint = uint64(9);

m_bigd = java.math.BigDecimal(num2str(m_uint));


% =================
% key gen
% =================
p_bigd = java.math.BigDecimal('1667');
q_bigd = java.math.BigDecimal('1669');

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

% p = uint64(251);
% q = uint64(257);


p_minus1_bigd = p_bigd.subtract(java.math.BigDecimal('1'));
q_minus1_bigd = q_bigd.subtract(java.math.BigDecimal('1'));
phi_bigd = p_minus1_bigd.multiply(q_minus1_bigd);


n_bigd = p_bigd.multiply(q_bigd);
nSquare_bigd = n_bigd.multiply(n_bigd);

g_bigd = n_bigd.add(java.math.BigDecimal('1'));
lambda_bigd = phi_bigd;
phi_minus1_bigd = phi_bigd.subtract(java.math.BigDecimal('1'));
mu_temp_bigd = phi_bigd.pow(double(phi_minus1_bigd));
mu_bigd = mu_temp_bigd.remainder(n_bigd);  % 49748


% =================
% Encrypt
% =================
% m = 1;

g_temp_bigd = g_bigd.pow(double(m_bigd));
g_temp_bigd = g_temp_bigd.remainder(nSquare_bigd);
r_bigd = java.math.BigDecimal('3');
r_temp_bigd = r_bigd.pow(double(n_bigd));
r_temp_bigd = r_temp_bigd.remainder(nSquare_bigd);

c_temp_bigd = g_temp_bigd.multiply(r_temp_bigd);
c_bigd = c_temp_bigd.remainder(nSquare_bigd);  % 3139926596



% =================
% Decrypt
% =================
recU_temp_bigd = c_bigd.pow(double(lambda_bigd));
recU_bigd = recU_temp_bigd.remainder(nSquare_bigd);
% recU_uint = fastPowerMod(c_uint, lambda_uint, nSquare_uint);

recL_temp_bigd = recU_bigd.subtract(java.math.BigDecimal('1'));
recL_temp_bigd = recL_temp_bigd.subtract(recL_temp_bigd.remainder(n_bigd));
recL_bigd = recL_temp_bigd.divide(n_bigd);




% temp_recU_uint = recU_uint - 1;
% temp_recU_uint = temp_recU_uint - mod(temp_recU_uint, n_uint);
% recL_uint = temp_recU_uint / n_uint;


recM_bigd = recL_bigd.multiply(mu_bigd);
recM_bigd = recM_bigd.remainder(n_bigd);

% recM = fastMultMod(recL_uint, mu_uint, n_uint);


% end





