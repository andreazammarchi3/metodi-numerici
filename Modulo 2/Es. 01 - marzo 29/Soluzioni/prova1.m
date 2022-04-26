clc
clear


A=@(alpha)[1 1 1; 0 alpha alpha; alpha 2*alpha alpha];
Ainv=@(alpha)[1 -1/alpha 0; -1 0 1/alpha; 1 1/alpha -1/alpha];

n1A=zeros(50,1);
n1Ainv=zeros(50,1);

k=1;

for alpha=linspace(0.001,2/3,50)
    n1A(k)=my_norm_1(A(alpha));
    n1Ainv(k)=my_norm_1(A(alpha));
end
condA=n1A.*n1Ainv;

disp(n1A);
disp(n1Ainv);
disp(condA);