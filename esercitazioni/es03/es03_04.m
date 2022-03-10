clc
clear all

% 0.3, 0.2 e 0.1 in binario hanno infinite cifre di mantissa
% perciò nel momento del floating devo arrotondare, perdendo
% delle cifre

(0.3 - 0.2) - 0.1   % = -2^(-55)
0.3 - (0.2 + 0.1)   % = -2^(-54)

0.1 * (0.2 + 0.5)
0.1 * 0.2 + 0.1 * 0.5