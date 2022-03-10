clc
clear all

for n=2:2:12
    x=10^(-n);
    ((sin(x))^2)/(x^2*(1+cos(x)))
end