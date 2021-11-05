%{
    Author: Aarón Escoboza Villegas 
    function: nearml 
    @inputs: simbolo enviado y nivel 
%}    
function nearml(y,n)
    global M, global dist, 
    global Nd,global Dmin,
    global level,global S,
    global skip,global pos,
    global ohm;
    
    for k = 1:M 
        if(skip == true && dist(n-1) > dist(n))
            break;
        end
        level(n+1) = k;
        %d2 = distn2()% Realizar la norma para todos los simbolos de la constelación
        dist(n) = dist(n) + dist(n+1); 
        S(n) = ohm(pos(n));
        if(skip == true && dist(n) > Dmin)
            break;
        end
        if (n > 1)
            nrealml(y,n-1)
        else
            if( dist(n) < Dmin) 
                Dmin = dist(n)
                s(1) = S(n,1);
              for i = n + 1 : Nd
                  s(i) = S(i,level(i));
              end
            end
        end
    end
end