clear all
close all
a=0;
b=2
N=6;
x1=linspace(a,b,N+1);
h=(b-a)/N;
syms alpha  x
f=x.^5+2*alpha*x.^4+4*x.^3+4*alpha^2*x.^2+3;
x=x1(1);
%Valutazione dell'espressione simbolica dell'integrale con formula dei
%trapezi composita N=6
N=6;
Itilde=subs(f);
for i=2:N
    x=x1(i);
    Itilde=Itilde+2*subs(f);
end
x=x1(N+1);
Itilde=Itilde+subs(f);
Itilde=h/2*Itilde;

%Integrale esatto in funzione di alpha
Iesatto=32/3*alpha^2+64/5*alpha+98/3;
Errore=abs(Itilde-Iesatto)
%Per calcolare il valore di alpha reale per cui l'errore è minimo,
%calcoliamo la derivata rispetto ad alfa dell'errore
dE=diff(Errore,alpha)
%Con la funzione solve, calcoliamo il valore di alpha che annulla la
%derivata dell'errore rispetto ad alpha
alphamin=solve(dE)
%Valore di alpha per cui si ha il minimo errore
alphamin=double(alphamin(1))
%Disegno dell'errore al variare di alpha
alphan=linspace(-5/2,-3/2,100);
In=matlabFunction(Itilde);
Iesatton=matlabFunction(Iesatto);
Erroren=abs(In(alphan)-Iesatton(alphan));

%Errore corrispondente al valore di alpha che lo rende minimo
Erroremin=abs(In(alphamin)-Iesatton(alphamin));

figure
plot(alphan,Erroren)
hold on
plot(alphamin,Erroremin,'ro')


%ALTERNATIVA
%SOLUZIONE NUMERICA

 k=1;
 for a=linspace(-5/2,-3/2,100)
    f= @(x) x.^5+2*a*x.^4+4*x.^3+4*a^2*x.^2+3;
    IntegraleTilde(k)=TrapComp(f,0,2,6);
 k=k+1;
 end
  alphan=linspace(-5/2,-3/2,100);
 ErroreNumerico=abs(IntegraleTilde-Iesatton(alphan));
 figure
 plot(alphan,ErroreNumerico)
 [minimo,val]=min(ErroreNumerico)
 alphan(val)
 hold on
 plot(alphan(val),ErroreNumerico(val),'ro')






