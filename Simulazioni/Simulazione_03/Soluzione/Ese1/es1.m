clear all
close all
A =[10 -4 4 0; -4 10 0 2; 4 0 10 2; 0 2 2 0]
B=[5 -2 2 0; -2 5 0 1; 2 0 5 1; 0 1 1 5]   


%punto a
%La matrice A simmetrica non ha tutti i minori principali >0 (cioe' i determinanti delle 
% sottomatrici principali) , non è definita positiva, non ammette fattorizzazione di Cholesky

if(A==A')
    disp('Matrice simmetrica')
end
n=4;
for i=1:n
    detA(i)=det(A(1:i,1:i))
    if detA(i)<=0
        fprintf("minore di ordine %d  negativo \n",i)
         disp('Matrice A non definita positiva')
    end
end
if(B==B')
    disp('Matrice B simmetrica')
end
for i=1:n
    detB(i)=det(B(1:i,1:i))
    if detB(i)<=0
        fprintf("minore di ordine %d  negativo \n",i)
         disp('Matrice B non definita positiva')
    end
end

%La matrice B, simmetrica, è definita positiva,ammette fattorizzazione di Cholesky


if all(detA~=0)
    disp('Matrice A ammette fattorizzazione di Gauss senza pivoting')
end

if all(detB~=0)
    disp('Matrice B ammette fattorizzazione di Gauss senza pivoting')
end

%Le matrici A e B ammettono fattorizzazione di Gauss senza pivoting in
%quanto hanno tutti i minori principali con determinante non nullo.

%Punto d
[L,U,flag]=LU_nopivot(A);

diagU=diag(U);
determinanteA=prod(diagU)

%Il determinante dell'inversa di una matrice è uguale al reciproco del
%determinante della matrice di partenza
det_invA=1/determinanteA

%Punto d
[L,U,flag]=LU_nopivot(B);

diagU=diag(U);
determinanteB=prod(diagU)

%Il determinante dell'inversa di una matrice è uguale al reciproco del
%determinante della matrice di partenza
det_invB=1/determinanteB
