close all
clear
clc


a = uint64(51241);
n = uint64(199184);
gcd(a, n)

% a_inv = fastPowerMod(a, uint64(10), n)
a_inv = fastPowerMod(a, phiFun(n)-1, n)
mod(a*a_inv, n)


% for idx = 2:50
% 	phiValue = phiFun(uint64(idx));
% 	disp([idx phiValue]);
% end


% a1_uint = uint64(5591980800) - 4;
% a2_uint = uint64(5591980800) - 5;
% modulus_uint = uint64(5591980800);

% mult_uint = fastMultMod(a1_uint, a2_uint, modulus_uint);
% mult_uint
