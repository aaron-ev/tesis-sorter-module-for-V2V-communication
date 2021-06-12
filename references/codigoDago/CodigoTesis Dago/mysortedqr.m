function [Q1 R P] = mysortedqr(H,equ,sigma,flag)
[nr nt] = size(H);
R=H*zeros(nt,nt)+H*j*zeros(nt,nt);

if(equ==0)
    Q=H;
else
    Q=[H;eye(nt)*sigma];
end

% se crea el vector de ordenamiento
P = 1:nt;

for k=1:nt,
    if(k<nt && flag==1)
        for m=k:nt,
            norma(m) = ValorNorma(Q(:,m));
        end
        [val pos]=min(norma(k:end));
        
        if(equ==0)
            rows=nr;
        else
            rows=nr+k-1;
        end
        % se intercambian columnas de P, Q y R
        pos = pos+k-1;
        aux = P(k);
        P(k) = P(pos);
        P(pos) = aux;
        
        aux = Q(1:rows,k);
        Q(1:rows,k) = Q(1:rows,pos);
        Q(1:rows,pos) = aux;
        
        aux = R(:,k);
        R(:,k) = R(:,pos);
        R(:,pos) = aux;
    end
%     R(k,k) = norm(Q(:,k));
%     Q(:,k) = Q(:,k) /  R(k,k) ;
    R(k,k) = sqrt(ValorNorma(Q(:,k)));
    
    Q(:,k) = cast(Q(:,k),'double')/cast(R(k,k),'double');
    
    for l=k+1:nt;
        R(k,l) = Q(:,k)'*Q(:,l);
        Q(:,l) = Q(:,l) - R(k,l)*Q(:,k);
    end
end
if(equ==0)
    Q1=Q;
else
    Q1=Q(1:nr,:);
end

end