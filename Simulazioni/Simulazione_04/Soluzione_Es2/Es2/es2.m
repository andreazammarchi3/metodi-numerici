syms a
A=[8 4  0 0 ; 4 4 a -1; 0 a 1/2*(a+2)^2 a+1; 0 -1  a+1 a+1];
B=[8 4  0 0 ; 4 4 a -1; 0 a 1/2*(a+2)^2 a+1; 0 -1  a+1 2];

%a)
for i=1:4
    detA(i)=det(A(1:i,1:i));
end

%I determinanti delle sottomatrici principali di A sono:
%[8, 16, 32*a + 32, -4*a^2]
%Poichè -4a^2 non è mai positivo, non esiste alcun valore di a per cui la
%matrice A possa essere definita positiva( minori principali >0)

for i=1:4
    detB(i)=det(B(1:i,1:i));
end
%I determinanti delle sottomatrici principali di B sono:
%[8, 16, 32*a + 32, 32 - 36*a^2]
%Si verifica che per -sqrt(32)/6<a<sqrt(32)/6 la matrice B è definita
%positiva ( minori principali >0)
%Quindi il valore astar=1/2 rientra in questo range di valori

%b)
astar=1/2;
Bs=matlabFunction(B);
M=Bs(astar)
b=[4;-1;-2;-3];
L=chol(M,"lower");
y=Lsolve(L,b);
x=Usolve(L',y)

    flag=0;
    for i=1:4
      detM(i)=det(M(1:i,1:i));
      if detM(i)==0
          flag=1;
      end
    end
    if flag==0
         disp("Gauss senza pivoting applicabile: minori principali diversi da zero")
    else
         disp("Gauss senza pivoting non applicabile")
    end

 %Il determinante di M=L'*L, si  calcola facendo il prodotto degli elementi diagonali
 %della matrice L per il prodotto degli elementi diagonali della matrice
 %L', quindi

detM= (L(1,1)*L(2,2)*L(3,3)*L(4,4))^2