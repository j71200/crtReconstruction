clear
clc

p = uint64(243);
q = uint64(19);
pp = crtReconstruct(p, 3);
pp = crtReconstruct(p, 3);

modulus_uint = uint64([521, 523, 541]);
% modulus_uint = uint64([307, 311, 313]);
% modulus_uint = uint64([256, 257, 259]);

remainders_uint = uint64([191, 243, 16]);
rec1 = crt(remainders_uint, modulus_uint);

remainders_uint = uint64([17, 19, 1]);
rec2 = crt(remainders_uint, modulus_uint);


double(mod(rec1, modulus_uint(1)))
double(mod(rec1, modulus_uint(2)))
double(mod(rec1, modulus_uint(3)))

double(mod(rec2, modulus_uint(1)))
double(mod(rec2, modulus_uint(2)))
double(mod(rec2, modulus_uint(3)))

rec = rec1+rec2;
double(mod(rec, modulus_uint(1)))
double(mod(rec, modulus_uint(2)))
double(mod(rec, modulus_uint(3)))






