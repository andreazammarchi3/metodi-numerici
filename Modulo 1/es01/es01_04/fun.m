function v = fun(n)
    v=n;
    while(n>1)
        if rem(n,2)==0
            n=n/2;
        else
            n=3*n+1;
        end
        v=[v,n];
    end
    
end