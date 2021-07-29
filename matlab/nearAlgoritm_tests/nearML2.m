
%{
	yp = vector recibido
	R = Matriz R de la descomposicion QR
	nstd = Ruido estandar
	QRM = Sobrevivientes en el algoritmo near ML
	P = 
	N = 
%}

function [s_est nodos] = nearML(yp,R,conste,nstd,QRM,P,N)
numColumns = size(R,2); 

%% detección para el último nivel numColumns

%se obtiene el distancia del vector recibido con todo los simbolos de la constelacion
d2 = abs(yp(numColumns) - R(numColumns,numColumns)*conste).^2;

[dist pos] = sort(d2); 

%% se obtienen los mejores QRM simbolos de le detección
for i = 1:QRM
	%%se toman los mejores simbolos con menor error 
	S(numColumns,i) = conste(pos(i)); 
    
	%investigar la siguiente linea
	parentSymb(numColumns,i) = index(i) - 1;
	
	%%vector que guarda la distancia de los mejores QRM nodos 
	d_m(numColumns,i) = dist(i); 
	
	%investigar la siguiente linea
	y(:,i);
end 
%% detección para los niveles restantes numColumns-1:1

for k = numColumns-1:-1:1
    %cota para podar el arbol
    cota = 3*(numColumns-k+1)*nstd^2;
    
    %%por cada nivel se realiza la deteccion de QRM mejores simbolos
    for l = 1:QRM 
        
    end
    
end
end







