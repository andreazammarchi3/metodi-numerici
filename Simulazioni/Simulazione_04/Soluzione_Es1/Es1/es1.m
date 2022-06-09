clear all
close all
f=@(x) sin(x)+sin(5*x);
x1 = [0 : pi/3 : 2 *pi];
y1=f(x1);  %y1 sono valori dove la funzione f si annulla
x2 = [pi/6, 2 *pi/5, 4*pi/5, 8*pi/5, 11*pi/6];
y2=f(x2);

xx=linspace(0,2*pi,100);
yy1 = InterpL(x1, y1, xx);
 
yy2 = InterpL(x2, y2, xx);
  
  figure
  plot(x1,y1,'o',x2,y2,'*',xx,f(xx),'r',xx,yy1,'g',xx,yy2,'b');
  legend("Set 1 ","Set 2","Funzione esatta", "Interpolazione Lagrange set 1","Interpolazione Lagrange set 2")

  %p2 approssima meglio f

  a1 =coeff_InterpN(x1,y1);
  a2 = coeff_InterpN(x2,y2);
   
  %Formula simbolica del polinomio di interpolazione di Newton nella variabile z
%Noti i coefficienti a1 del polinomio nella base di Newton, implemento in
%maniera simbolica l'algoritmo di Horner per la valutazione del polinomio
%di Newton nella variabile simbolica z:

syms z
n=length(x1);
ps=a1(n);
      for k=n-1:-1:1
         ps= (z-x1(k))*ps + a1(k);
      end

%Trasformo la formula simbolica in matlab function, che servirà come
%argomento per calcolare l'integrale del polinomio interpolatore
p1=matlabFunction(ps);
     
   [IN1,N]=traptoll(p1,0,2*pi,1e-4)
   

     %Formula simbolica del polinomio di interpolazione di Newton nella variabile z
%Noti i coefficienti a2 del polinomio nella base di Newton, implemento in
%maniera simbolica l'algoritmo di Horner per la valutazione del polinomio
%di Newton nella variabile simbolica z:

syms z
n=length(x2);
ps=a2(n);
      for k=n-1:-1:1
         ps= (z-x2(k))*ps + a2(k);
      end

%Trasformo la formula simbolica in matlab function, che servirà come
%argomento per calcolare l'integrale del polinomio interpolatore
p2=matlabFunction(ps);
%      p2= @(z) c1(1)+(z-x1(1))*c1(2)+(z-x1(1)).*(z-x1(2)).*c1(3)+(z-x1(1)).*(z-x1(2)).*(z-x1(3)).*c1(4)+(z-x1(1)).*(z-x1(2)).*(z-x1(3)).*(z-x1(4))*c1(5)+(z-x1(1)).*(z-x1(2)).*(z-x1(3)).*(z-x1(4)).*(z-x1(5))*c1(6)+...
%          (z-x1(1)).*(z-x1(2)).*(z-x1(3)).*(z-x1(4)).*(z-x1(5)).*(z-x1(6))*c1(7);

      [IN2,N]=traptoll(p2,0,2*pi,1e-4)
   
 %Integrale esatto di f
 syms x
 fs=sin(x)+sin(5*x)
 Iesatto=double(int(fs,0,2*pi))

 %Poiche l'integrale esatto è zero, si avvicina di più all'integrale esatto
 %l'integrale di p1
    

 