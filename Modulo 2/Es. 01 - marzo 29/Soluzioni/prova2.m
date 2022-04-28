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

condZ=n_inf_Z.*n_inf_Zinv;
alpha=linspace(30,1000, 50);
figure
plot(alpha, condZ, 'b')

