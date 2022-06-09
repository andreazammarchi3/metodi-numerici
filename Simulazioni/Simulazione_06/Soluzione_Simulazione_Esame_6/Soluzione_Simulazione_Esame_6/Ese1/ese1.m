clear all
close all
syms x
fs= exp(x+1)+3*x
dfs= diff(fs,x,1);
f=matlabFunction(fs);
df=matlabFunction(dfs);

a=-1;
b=2;

x=linspace(a,b,200);
figure
plot(x,f(x))
hold on
plot(x,zeros(size(x))) %Disegno asse x

tolx=1e-12;
tolf=1e-12;
nmax=500;

%1
figure
x0=0;
m=2.5:0.5:4;
for i=1:4
    [x1,xk,it]=corde(f,m(i),x0,tolx,tolf,nmax);
    subplot(2,2,i);
    semilogy(1:it,abs(xk))
    ordine=stima_ordine(xk,it);
    fprintf("m= %f x0 = %f zero= %f iterazioni = %d ordine= %f \n ",m(i),x0,x1,it,ordine)
end

%2
figure
m=5;
x0=[0,0.5,1];
for i=1:3
    [x1,xk,it]=corde(f,m,x0(i),tolx,tolf,nmax);
    subplot(3,1,i);
    semilogy(1:it,abs(xk))
    ordine=stima_ordine(xk,it);
    fprintf("m= %f x0 = %f zero= %f iterazioni = %d ordine= %f \n ",m,x0(i),x1,it,ordine)
end

%3
figure
x0=-1:0.5:1;
for i=1:5
    m=df(x0(i));
    [x1,xk,it]=corde(f,m,x0(i),tolx,tolf,nmax);
    subplot(3,2,i);
    semilogy(1:it,abs(xk))
    ordine=stima_ordine(xk,it);
    fprintf("m= %f x0 = %f zero= %f iterazioni = %d ordine= %f \n ",m,x0(i),x1,it,ordine)
end

