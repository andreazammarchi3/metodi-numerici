clc
clear all

av=0.01:0.01:9.99;
n=length(av);
K2=zeros(1,n);

for i=1:n
    A=[3 0 1; 0 av(i) 0; 1 0 1];
    K2(i)=cond(A);
end

figure(1)
plot(av,K2, 'b-')
