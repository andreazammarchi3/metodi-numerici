clear all
close all
f0= @(x) x.^3+1;
f1= @(x) x.^3-2*x.^2+1;
figure
fplot(f0,[-2,2]);
title('Funzione f0')

figure
fplot(f1,[-2,2]);
title('Funzione f1')

tol=1e-6
[IT0,NT0]=traptoll(f0,-2,2,tol);
fprintf("Integrale f0  --> %f Numero di suddivisioni Trap --> %d \n",IT0,NT0)
[IT1,NT1]=traptoll(f1,-2,2,tol);
fprintf("Integrale f1  --> %f Numero di suddivisioni Trap --> %d \n",IT1,NT1)


[IS0,NS0]=simptoll(f0,-2,2,tol);
fprintf("Integrale f0  --> %f Numero di suddivisioni Simp --> %d \n",IS0,NS0)
[IS1,NS1]=simptoll(f1,-2,2,tol);
fprintf("Integrale f1  --> %f Numero di suddivisioni Simp --> %d \n",IS1,NS1)


%Per le due funzioni f0 ed f1, il metodo di Simpson utilizza solo 1
%sottointervallo, perchè la formula di Simpson è esatta se la funzione
%integranda è un polinomio che ha la derivata quarta nulla, quindi è esatta per
%funzioni integrande che sono polinomio fino al grado 3.
%per la funione f0 trapezi utilizza solo 1 suddivisione per la simmetia
%della funzione
