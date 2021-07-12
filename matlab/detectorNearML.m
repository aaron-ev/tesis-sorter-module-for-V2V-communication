%{
    Author: Aarón Escoboza Villegas 
    function:detectorNearML 
    @inputs:R,y,order,M,ohm,Nd 
    @output:s
%}

function s = detectorNearML(y,R)
    % global variables
    global Nd,global Dmin,global skip;
    global level,global S; 
    Dmin = inf; 
    skip = true; 
    level = []; 
    S = []; 
    l = Nd;
    d2 = distanceL2(y,R,l) % Realizar la norma para todos los simbolos de la constelación
    dist = insertion_sort(d2); % En orden ascendente
    pos = insertion_sort(d2); % En orden ascendente
    %S = ohm(posl);
    nearml(y,l-1);
    s = 2; 
    %s(order) = sest(simbolo estimado);
end