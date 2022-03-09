a=[1.2, 5.4, 6, 1.5, 9];
b=[5.2, pi, 1.2, 1.5, 2];

for i=1:1:5
    disp('sqrt');
    disp(sqrt(a(i)));

    disp('exp');
    disp(exp((a(i))/2));

    disp('a+b');
    disp(a(i)+b(i));

    disp('a*b');
    disp(a(i)*b(i));

    disp('d');
    d=[0:0.5:30];
    disp(d);

    
end

disp('c')
c=a+b;
disp(c);

