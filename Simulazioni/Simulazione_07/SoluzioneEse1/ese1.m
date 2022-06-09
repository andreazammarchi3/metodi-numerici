%ESE1 esame 20 dicembre 2021
clear all
close all

f= @(x) sin(x)+sin(6*x)


x1=[0:2/7*pi:2*pi]';
x2= [pi/7, pi/3,2*pi/3, 4*pi/3, 5*pi/3, 13*pi/7]';


y1=f(x1);
y2=f(x2);
xval=linspace(-pi/2,5*pi/2,200);

%Costruzione polinomio approssimante di grado 3 calcolato sul primo set di
%dati
n=3;  %grado del polinomio approssimante
A1=costruisci_vander(x1,n+1);
a1=metodoQR(A1,y1);
p1=pvalHorner(a1,xval);

%Costruzione polinomio approssimante di grado 3 calcolato sul secondo set di
%dati
A2=costruisci_vander(x2,n+1);
a2=metodoQR(A2,y2);
p2=pvalHorner(a2,xval);

figure
plot(xval,p1,'r-',x1,y1,'o',xval,p2,'g-',x2,y2,'*',xval,f(xval),'k-')
legend('caso 1. Polinomio Approssimante di grado ', 'Dati','caso 2. Polinomio Approssimante di grado ', 'Dati','Funzione esatta')

%Costruzione del polinomio interpolatore di Lagrange - primo set di dati
polint1=InterpL(x1',y1',xval);
%Costruzione del polinomio interpolatore di Lagrange - secondo set di dati

polint2=InterpL(x2',y2',xval);

figure
plot(xval,polint1,'r-',x1,y1,'o',xval,polint2,'g-',x2,y2,'*',xval,f(xval),'k-')
legend( 'caso 1. Polinomio Interpolante', 'Dati','caso 2. Polinomio Interpolante', 'Dati','Funzione esatta')
