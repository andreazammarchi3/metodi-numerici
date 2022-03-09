clc
clear all

k=[1/3,1/2,1,2];
x=linspace(-pi,pi,100);

color=['b','r','y','g'];
style=['o','+','*','x'];

figure(1)
hold on

for i=1:1:4
    y=sin(k(i)*x);
    plot(x,y,[color(i),style(i)]);
end

