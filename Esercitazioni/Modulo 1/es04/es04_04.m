clc
clear all

A=hilb(4);
b=ones(4,1);

x=A\b;

db=[1; -1; 1; -1] * 0.01;
btilde=b+db;

xtilde=A\btilde;

Erel_in = norm(b-btilde)/norm(b)
Erel_res = norm(x-xtilde)/norm(x)