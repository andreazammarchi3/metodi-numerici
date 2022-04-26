clc
clear all

format long e

a=1.234567890123400e+15;
b=-1.234567890123401e+15;
c=0.06;

ris1=(a+b)+c
ris2=(a+c)+b    % a+c = a
ris3=a+(b+c)    % b+c = b

a=0.23371258e-4;
b=0.33678429e+2;
c=-0.33677911e+2;

ris1=(a+b)+c
ris2=(a+c)+b
ris3=a+(b+c)