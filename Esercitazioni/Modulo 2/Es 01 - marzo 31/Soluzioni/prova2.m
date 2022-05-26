clc
clear all

Z=@(alpha)[11+alpha 10+alpha 14+alpha;
    12+alpha 11+alpha -13+alpha;
    14+alpha 13+alpha -66+alpha];

Zinv=@(alpha)[-55*alpha-557 83*alpha+842 -28*alpha-284;
    55*alpha+610 -83*alpha-922 28*alpha+311;
    2 -3 1];

n_inf_Z=zeros(50, 1);
n_inf_Zinv=zeros(50,1);

k=1;
for alpha=linspace(30,1000, 50)
    n_inf_Z(k)=my_norm_inf(Z(alpha));
    n_inf_Zinv(k)=my_norm_inf(Zinv(alpha));
    k=k+1;
end

disp("n_inf_Z=" + n_inf_Z);
disp("n_inf_Zinv=" + n_inf_Zinv);
% a) norma inf di Z è massima per alpha =1000, ed è guale a 3035, mentre
% norma inf di Zinv è massima per alpha =1000, ed è uguale a 167843.

condZ=n_inf_Z.*n_inf_Zinv;
alpha=linspace(30,1000, 50);
figure
plot(alpha, condZ, 'b')
% b) Il numero di condizionamento cresce esponenzialmente con l'aumentare
% di alpha, rendendo il problema mal condizionato.

% c) Ancora non possiamo risolverlo, usiamo il '\'.

b=@(alpha)[3*alpha+35; 3*alpha+10; 3*alpha-39];
sol=[1;1;1];
alpha=30;
vb=b(alpha);
matZ=Z(alpha);
delta=[10^(-3) 10^(-4) 10^(-5) 10^(-6)];
for i=1:length(delta)
    dZ=zeros(3);
    dZ(1,1)=delta(i);
    Zp=matZ+dZ;
    xp=Zp\vb;
    
    err_perc_dat(i)=my_norm_inf(Zp-matZ)/my_norm_inf(matZ)*100;
    err_perc_sol(i)=my_norm_inf(xp-sol)/my_norm_inf(sol)*100;
end

Erel_perc_dat=err_perc_dat';
Erel_perc_sol=err_perc_sol';

T=table(Erel_perc_dat, Erel_perc_sol)
% f) La matrice Z(alpha) con alpha=30 ha indice di condizionamento elevato,
%K=852875, piccole perturbazioni sui dati vengono amplificate sui risultati




