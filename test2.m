close all
clear
clc

for idx = 2:50
	phiValue = phiFun(uint64(idx));
	disp([idx phiValue]);
end


% a1_uint = uint64(5591980800) - 4;
% a2_uint = uint64(5591980800) - 5;
% modulus_uint = uint64(5591980800);

% mult_uint = fastMultMod(a1_uint, a2_uint, modulus_uint);
% mult_uint
