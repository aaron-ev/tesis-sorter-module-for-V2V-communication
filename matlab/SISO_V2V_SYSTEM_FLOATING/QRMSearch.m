function [s_est nodos] = QRMSearch(yp,R,conste,nstd,QRM,P,N)
global maxValues;
global minValues;
[rows nt] = size(R);

dim = length(conste);
nodos=1;
minValues(1) = min([real(yp') imag(yp')]);  
minValues(2) = min([min(min(real(R)));min(min(imag(R)))]); 
minValues(3) = min([real(conste) imag(conste)]); 
% se realiza la detecci�n del nivel Nt
error = abs(yp(nt) - R(nt,nt)*conste).*abs(yp(nt) - R(nt,nt)*conste);
maxValues(1) = max(error);
[dist ord] = sort(error);
maxValues(2) = max(dist);
for k=1:QRM,
    parent_node(nt,k) = conste(ord(k));
    parent_symb(nt,k) = ord(k)-1;
    parent_dist(nt,k) = dist(k);
    parent_yp(:,k) = yp(:,1);
end

% Se realiza la detecci�n en la Nt-1 capas
for k=nt-1:-1:1,
    Vth1 = 3*(nt-k+1)*nstd^2; % cota para podar arbol en cada nivel
    maxValues(3) = max(Vth1);
    %% se realiza la detecci�n de la capa Nt-k capas restantes
    col=1;
    for l=1:QRM,
        distp = parent_dist(k+1,l);
        sest = parent_node(k+1:nt,l);
        symb = parent_symb(k+1:nt,l);
        rm = parent_yp(:,l);
        rm = rm - R(:,k+1)*sest(1);
%       error = (abs(rm(k,1) - R(k,k)*conste).^2);
        error = (abs(rm(k,1) - R(k,k)*conste).*abs(rm(k,1) - R(k,k)*conste));
        distt= distp + error;
        [dist2 ord2] = sort(distt);
        maxValues(4) = max(dist2);
        for p=1:QRM, % se guardan las M ramas de cada uno de los QRM puntos por nivel
            parent_node2(k,col)= conste(ord2(p));
            parent_node2(k+1:nt,col)= sest;
            parent_symb2(k,col)= ord2(p)-1;
            parent_symb2(k+1:nt,col)= symb;
            parent_dist2(k,col) = dist2(p);
            parent_dist2(k+1,col) = distp;
            parent_yp2(:,col) = rm;
            col = col+1;
        end
        nodos = nodos+1;
        if(l<QRM)
            if(parent_dist(k+1,l+1) > Vth1)
                break
            end
        end
    end
    %% se seleccionan las QRM mejores para este nivel
    [dist3 ord3] = sort(parent_dist2(k,1:col-1));
    for l=1:QRM,
        parent_node(:,l) =  parent_node2(:,ord3(l));
        parent_symb(:,l) = parent_symb2(:,ord3(l));
        parent_dist(:,l) =  parent_dist2(:,ord3(l));
        parent_yp(:,l) =  parent_yp2(:,ord3(l));
    end
end
s_est(P,1) = parent_symb(:,1);
end