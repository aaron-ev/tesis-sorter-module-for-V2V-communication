function [s_est nodos] = QRMSearch(yp,R,conste,nstd,QRM,P,N)
% Signed = 1;
% Word_Length = 16;
% Integer_Part = 5;
% Fractional_Part = Word_Length - Integer_Part;
%
% Data_Format = numerictype('Signed',Signed,'WordLength',Word_Length,'FractionLength',Fractional_Part);
%
% Data_OP = fimath('RoundMode','Nearest','OverflowMode','saturate',...
%     'ProductMode','SpecifyPrecision',...
%     'ProductWordLength',Word_Length,...
%     'ProductFractionLength',Fractional_Part,...
%     'SumMode','SpecifyPrecision',...
%     'SumWordLength',Word_Length,...
%     'SumFractionLength',Fractional_Part);
%
% yp = fi(yp,Data_Format, Data_OP);
% R = fi(R,Data_Format, Data_OP);
% conste = fi(conste,Data_Format, Data_OP);
% nstd = fi(nstd,Data_Format, Data_OP);
% se inicialan variables
[rows nt] = size(R);

dim = length(conste);
nodos=1;

% se realiza la detección del nivel Nt
error=abs(yp(nt) - R(nt,nt)*conste).*abs(yp(nt) - R(nt,nt)*conste);
[dist ord]=sort(error);

for k=1:QRM,
    parent_node(nt,k) = conste(ord(k));
    parent_symb(nt,k) = ord(k)-1;
    parent_dist(nt,k) = dist(k);
    parent_yp(:,k) = yp(:,1);
end

% Se realiza la detección en la Nt-1 capas
for k=nt-1:-1:1,
    Vth1 = 3*(nt-k+1)*nstd^2; % cota para podar arbol en cada nivel
    %% se realiza la detección de la capa Nt-k capas restantes
    col=1;
    for l=1:QRM,
        distp = parent_dist(k+1,l);
        sest = parent_node(k+1:nt,l);
        symb = parent_symb(k+1:nt,l);
        rm = parent_yp(:,l);
        rm = rm - R(:,k+1)*sest(1);
%         error = (abs(rm(k,1) - R(k,k)*conste).^2);
        error = (abs(rm(k,1) - R(k,k)*conste).*abs(rm(k,1) - R(k,k)*conste));
        distt= distp + error;
        [dist2 ord2]=sort(distt);
        for p=1:QRM, % se guardan las M ramas de cada uno de los QRM puntos por nivel
            parent_node2(k,col)= conste(ord2(p));
            parent_node2(k+1:nt,col)= sest;
            parent_symb2(k,col)= ord2(p)-1;
            parent_symb2(k+1:nt,col)= symb;
            parent_dist2(k,col) = dist2(p);
            parent_dist2(k+1,col) = distp;
            parent_yp2(:,col) = rm;
            col=col+1;
        end
        nodos=nodos+1;
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
