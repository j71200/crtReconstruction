close all
clear
clc

a = uint64([3, 5, 9]);
b = uint64([33, 32, 125]);

[c, d] = crt(a, b);
c

mod(c, b(1))
mod(c, b(2))
mod(c, b(3))

