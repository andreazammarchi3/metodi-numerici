clc
clear all

format long e

x = 0.1e-15;

vett=ones(1,10)*x;
res=1;
for i=2:10
    res=vett(i)+res
end

for i=2:10
    res=res-vett(i)
end