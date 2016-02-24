close all
clear
clc

% a = uint64([3, 5, 9]);
% b = uint64([33, 32, 125]);

a = uint64([98, 99, 105]);
b = uint64([257, 263, 269]);


[c, d] = crt(a, b);
c

mod(c, b(1))
mod(c, b(2))
mod(c, b(3))

