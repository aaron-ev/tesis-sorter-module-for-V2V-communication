%{
    Author: Aarón Escoboza Villegas
    Fiile: QRDescomposition.m 
    Description file: Performs QR descomposition of a matrix H
    @inputs:channel matrix, equalizater,ordering,system
    noise
    @outputs: Q R P 
%}
%This algorithm is presented in Del puerto thesis  


%equ = 0 ->LS
%equ = 1 ->MMSE 
%ordering = 0 ->unsorted
%ordering = 1 ->sorted 

function [Q1 R P] = sortedQR(H,equ,ordering,noise)

[numRow numCol] = size(H);
R = H*zeros(numRow,numCol)+H*j*zeros(numRow,numCol);

%step 4
if(equ == 0)
    Q = H; 
elseif(equ == 1)
    Q = [H;eye(nt)*noise];
end

% step 3 P sort vector 
P = 1:numCol;

for k = 1:numCol 
    if(k < numCol)
        %step 5:vector norma with euclidian distanes of numCol columns
        for m = k:numCol
            norma(m) = norma2(Q(:,m)); 
        end
        %step 6
        [val pos] = min(norma(k:end)); 
        
        if(equ == 0) 
            rows = numCol;
        elseif(equ == 1)
            rows = numCol + k - 1; 
        end
        
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
    R(k,k) = ValorNorma(Q(:,k));
    
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