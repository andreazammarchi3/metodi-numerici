clear all
close all
tol=10^-5;

f=@(x) x-sqrt(x-1);

a1=1;
b1=3;
xv=linspace(a1,b1,200);

x=linspace(a1,b1,4);
y=f(x);


%Valutazione del polinomio interpolatore di Newton nei punti xv
%in output: pval = valutazione; a= coefficienti del polinomio interpolatore

[pval,a] = InterpN(x,y,xv);

%Formula simbolica del polinomio di interpolazione di Newton nella variabile z
%Noti i coefficienti a del polinomio nella base di Newton, implemento in
%maniera simbolica l'algoritmo di Horner per la valutazione del polinomio
%di Newton nella variabile simbolica z:

syms z
n=length(x);
ps=a(n);
      for k=n-1:-1:1
         ps= (z-x(k))*ps + a(k);
      end

%Trasformo la formula simbolica in matlab function, che servirà come
%argomento per calcolare l'integrale del polinomio interpolatore
p=matlabFunction(ps);

figure
plot(xv,f(xv),'r-',xv,pval,'b-.',xv,p(xv))

[INf,Nf]=simptoll(f,a1,b1,tol);
fprintf("Integrale 1 --> %f Numero di suddivsioni %d \n ",INf,Nf)
[INp,Np]=simptoll(p,a1,b1,tol);
fprintf("Integrale 2 --> %f Numero di suddivsioni %d \n ",INp,Np)
Ifesatto=2.114381916835873;
Ipesatto=2.168048769926493;

Err1=abs(INf-Ifesatto)
Err2=abs(INp-Ipesatto)

%Nell'integrale I2, la funzione integranda e' un polinomio cubico e sappiamo
%che la formula di Simpson e' esatta per funzioni integrande che sono
%polinomi fino a quelli di grado 3, che hanno derivata 4 nulla (riocordiamo
%che l'errore nella formula di Simpson dipende dalla derivata quarta della
%funzion eintegranda). Ecco percè N=1 per il calcolo di I2.