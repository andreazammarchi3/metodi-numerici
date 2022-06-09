function p=plagr(xnodi,j)
%Restituisce i coefficienti del j-esimo pol di
%Lagrange associato ai punti del vettore xnodi


xzeri=[xnodi(1:j-1) xnodi(j+1:end)];

p=poly(xzeri);

p=p/polyval(p,xnodi(j));