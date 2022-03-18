clc
clear all

A=[6 63 662.2; 63 662.2 6967.8; 662.2 6967.8 73393.5664];
b=[1.1; 2.33; 1.7];

x=A\b;

dA=0.01*[1 0 0; 0 0 0 ; 0 0 0 ];
Atilde=A+dA;
xtilde=Atilde\b;

err_rel_dati=norm(A-Atilde)/norm(A)
err_rel_sol=norm(x-xtilde)/norm(x)