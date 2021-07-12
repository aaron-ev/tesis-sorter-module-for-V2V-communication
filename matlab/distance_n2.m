function Dn2 = distance_n2(y,n)
    global M,global x,global Nd,global R; 
    for i = 1:M
        term1 = y - R(n,n).*x(i);
        term2 = 0; 
        for k = n+1:Nd
            term2 = term2 + R(n,i)*S(n,level);
        end
       Dn2 = norm(term1-term2)^2;
    end
end