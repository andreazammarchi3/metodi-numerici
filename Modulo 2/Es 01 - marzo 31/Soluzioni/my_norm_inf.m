function n_inf=my_norm_inf(A)

[m,n]=size(A);
tmp=zeros(m, 1);

for i=1:m
    tmp(i)=sum(abs(A(i,:)));
end

n_inf=max(tmp);