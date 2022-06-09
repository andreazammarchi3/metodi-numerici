
clear all
close all

% tolleranza sulla x
tolx=1.e-12;
% tolleranza sulla funzione
tolf=1.e-12;
% n. massimo di iterazioni
nmax=500;
%punto iniziale
x0=3;
syms x 
fx=x-2*sqrt(x-1);
f=matlabFunction(fx);
%Dal grafico si vede che la funzione ha nel dominio [1,3] una radice
%multipla
figure
fplot(f,[1,3])

%Verifico che si tratta di una radice con molteplicità 2 (cioè in questa
%radice si annulla sia la funzione che la derivata prima) e la derivata
%seconda è la prima ad essere diversa da zero in questa radice.
dfx=diff(fx,x,1);
df2x=diff(fx,x,2);
df=matlabFunction(dfx);
df2=matlabFunction(df2x);
m=[];
alpha=double(solve(fx));  %solve restituisce il valore alpha in cui sia annulla funzione f
%Verifico se la derivata prima si annulla nello stesso punto in cui si
%annulla la funzione
if (df(alpha)==0)
    %Se la derivata seconda e' diversa da zero in alpha, allora la radice
    %ha molteplicità 2.
    if df2(alpha)~=0
        m=2;
    end
end

%Per costruire un metodo che converge quadraticamente alla soluzione
%utilizzo Newton modificato usando m=2 come molteplicità

[xnewm,xkm,nitm]=newtonm(f,df,m,x0,tolx,tolf,nmax);
fprintf('zero= %15.12f \n',xnewm);

%stima numerica dell'ordine
 ordineNmod=stima_ordine(xkm,nitm);

fprintf('p_newton_modificato=%f\n',ordineNmod)


%Punto d

err=abs([x0;xkm;alpha]-alpha);
figure
semilogy(1:nitm+2,err,'-')

%Punto e) partire da x0=1 non produce un metodo convergente perchè la
%derivata prima in x0=1 va a -infinito
