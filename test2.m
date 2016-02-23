clear
clc

remainders_uint = uint64([2 77 12 89])';
modulus_uint    = uint64([269 271 277 281])';

[x_uint, N_uint] = crt(remainders_uint, modulus_uint);

mod(x_uint, modulus_uint(1))
mod(x_uint, modulus_uint(2))
mod(x_uint, modulus_uint(3))
mod(x_uint, modulus_uint(4))

