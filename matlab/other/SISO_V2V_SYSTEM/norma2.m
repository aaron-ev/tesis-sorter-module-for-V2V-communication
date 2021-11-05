%{
    Author: Aarón Escoboza Villegas
    File: norma2 
    Description: perform norma ^ 2 
    Input: a vector 
    Output: norma ^ 2 
%}

function nor2 = norma2(v)
    nor2 = 0;
    for i = 1:length(v)
        nor2 = nor2 + imag(v(i))^2 + real(v(i))^2;
    end
end