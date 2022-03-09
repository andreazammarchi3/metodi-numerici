alpha=pi/4;
%matrice di rotazione di un angolo alpha in senso orario
R=[cos(-alpha),-sin(-alpha);sin(-alpha),cos(-alpha)]; %2x2

P=[-6,-6,-7,0,7,6,6,-3,-3,0,0,-6;
    -7,2,1,8,1,2,-7,-7,-2,-2,-7,-7]; %2x12

[r,c]=size(P);

figure(1)
x=P(1,:);
y=P(2,:);
plot(x,y,'b-')

figure(2)
Prot=R*P;
x=Prot(1,:);
y=Prot(2,:);
plot(x,y,'b-')