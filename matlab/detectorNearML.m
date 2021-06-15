%{
    Author: Aarón Escoboza Villegas 
    function:detectorNearML 
    @inputs:R,y,order,M,ohm,Nd 
    @output:s
%}

function s = detectorNearML(R,y,order,M,ohm,Nd)
    Dmin = inf; 
    skip = true; 
    level = []; 
    S = []; 
    l = Nd;
    dl_2 = % Realizar la norma para todos los simbolos de la constelación
    distl = dl_2; % En orden ascendente
    posl = dl_2; % En orden ascendente
    S = ohm(posl);
    nearml(y,l-1);
    s(order) = sest(simbolo estimado);
end