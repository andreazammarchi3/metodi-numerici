clc
clear


A=@(alpha)[1 1 1; 0 alpha alpha; alpha 2*alpha alpha];
Ainv=@(alpha)[1 -1/alpha 0; -1 0 1/alpha; 1 1/alpha -1/alpha];

n1A=zeros(50,1);
n1Ainv=zeros(50,1);

k=1;

for alpha=linspace(0.001, 2/3, 50)
    n1A(k)=my_norm_1(A(alpha));
    n1Ainv(k)=my_norm_1(Ainv(alpha));
    k=k+1;
end

disp("n1A=" + n1A);
disp("naAinv=" + n1Ainv);
% a) Norma 1 di A =1+3*a, ha valore maggiore quando a=2/3, quindi = 3

% b) Norma 1 di inv(A) =2/a, ha valore maggiore con a=0.001, quindi = 2000


condA=n1A.*n1Ainv;
alpha=linspace(0.001, 2/3, 50);
figure
plot(alpha, condA,'b')
% c) Il numero di condizionamento diminuisce esponenzialmente con
% l'aumentare di alpha.

% d) Il miglior condizionamento su A si ha quando alpha =2/3

% e) Il peggior condizionamento su A si ha quando alpha =0.001


b=[-8; -1; 9];
delta=[0.01 0.001 0.001; 0 0.001 0.001; 0 0.001 0.01];
k=1;

for alpha=linspace(0.001, 2/3, 50)
    matA=A(alpha);
    x=matA\b;
    matApert=matA+delta;
    xpert=matApert\b;
    err_perc_dat(k)=my_norm_1(delta)/my_norm_1(matA)*100;
    err_perc_sol(k)=my_norm_1(xpert-x)/my_norm_1(x)*100;
    k=k+1;
end

Erel_perc_dat=err_perc_dat';
Erel_perc_sol=err_perc_sol';

T=table(Erel_perc_dat, Erel_perc_sol)




