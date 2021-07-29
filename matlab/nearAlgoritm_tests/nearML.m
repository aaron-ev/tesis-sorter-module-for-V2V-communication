
%{
	yp = vector recibido
	R = Matriz R de la descomposicion QR
	nstd = Ruido estandar
	QRM = Sobrevivientes en el algoritmo near ML
	P = 
	N = 
%}


function [s_est nodos] = nearML(yp,R,conste,nstd,QRM,P,N)
Nd = size(R,2); %número de subportadoras 

%% detección para el último nivel numColumns

%se obtiene el error del vector recibido con todo los simbolos de la constelacion
D_Nd2 = abs(yp(Nd) - R(Nd,Nd)*conste).^2;

[D_Nd2 ord] = sort(D_Nd2); 

%% se obtienen los mejores QRM simbolos de le detección
for i = 1:QRM
	%%contiene los mejores QRM simbolos de la constelacion
	parentNode(Nd,i) = conste(ord(i)); 
    
	%contiene el simbolo en el indice anterior del simoblo seleccionado
	parentSymb(Nd,i) = ord(i) - 1;
	
	%vector que guarda la distancia de los mejores QRM nodos 
	parentDist(Nd,i) = D(i); 
	
	%se obtienen QRM vectores recibidos iguales
	parentYp(:,i) = yp(:,1);
end 
%% detección para los niveles restantes numColumns-1:1

for k = Nd-1:-1:1
    %cota para podar el arbol
    cota = 3*(Nd-k+1)*nstd^2;
    col = 1;
    %%por cada nivel se realiza la deteccion de QRM mejores simbolos
    for l = 1:QRM 
        distp = parent_dist(k+1,l);
        x = parent_node(k+1:nt,l);
        symb = parent_symb(k+1:nt,l);
        rm = parent_yp(:,l);
        rm = rm - R(:,k+1)*sest(1);       
    end
    
end
end








