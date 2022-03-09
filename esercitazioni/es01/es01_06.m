clc
clear all

f1=@(x) x.^3-3*x;
f2=@(x) 3*x.*cos(2*x);
f3=@(x) sin(x)./x;

xx1=linspace(-3,3,100);
xx2=linspace(0,2*pi,100);
xx3=linspace((-8)*pi,8*pi,100);

yy1=f1(xx1);
yy2=f2(xx2);
yy3=f3(xx3);

scelta=input('dimmi che f vuoi: ')

switch (scelta)
    case 1
        figure(1);
        plot(yy1);
    case 2
        figure(1);
        plot(yy2);
    case 3
        figure(1);
        plot(yy3);
    otherwise
        disp('valore non valido')
end

