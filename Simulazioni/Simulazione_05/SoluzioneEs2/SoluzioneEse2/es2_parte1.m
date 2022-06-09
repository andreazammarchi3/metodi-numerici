clear all
close all
f=@(x) 1./(1+900*x.^2);
z=linspace(-1,1,200)';
i=1;
for n=5:5:30
    
    %PUNTO A
    xe=-1+2*([1:n+1]-1)/n;
    xc=cos((2*[n+1:-1:1]-1)*pi/(2*(n+1)));
    ye=f(xe);
    yc=f(xc);
    [p1val,ae] = InterpN(xe',ye,z);
    [p2val,ac] =InterpN(xc',yc,z);
    
      
      %PUNTO B
     figure(1)
     subplot(2,3,i)
     plot(z,abs(f(z)-p1val));
     title(['Equidistanti n=',num2str(n)]);
     
     %PUNTO C
     figure(2)
     subplot(2,3,i)
     plot(z,abs(f(z)-p2val));
     title(['Chebichev n=',num2str(n)]);
     i=i+1;
end

%PUNTO D
i=0;
for n=5:5:30
    i=i+1;
    %----------------------------
    %nodi equispaziati
    xe=-1+2*([1:n+1]-1)/n;
    %nodi di Chebyshev 
    xc=cos((2*[n+1:-1:1]-1)*pi/(2*(n+1)));
    
    Le=zeros(200,1);
    Lc=zeros(200,1);
    %calcolo della costante di Lebesgue per ogni valore di n e per ogni
    %scelta del tipo di punti equidistanti o zeri di chebichev
    for l=1:n+1        
        pe=plagr(xe,l);
        Le=Le+abs(polyval(pe,z));
        pc=plagr(xc,l);
        Lc=Lc+abs(polyval(pc,z));
    end
    LLe(i)=max(Le);
    LLc(i)=max(Lc);

    %----------------------------
end

disp('Costante di Lebesgue con nodi equispaziati al variare di n: ')
LLe
 
disp('Costante di Lebesgue con nodi di Chebyshev al variare di n: ')
LLc 
    
figure(3)
semilogy([1:6 ],LLe,'r',[1:6 ],LLc,'b')
legend('nodi equispaziati','nodi di chebichev')