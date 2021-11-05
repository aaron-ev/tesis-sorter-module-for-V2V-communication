function Vnorma = ValorNorma(Q)
val = 0;
for i=1:length(Q)
    val = val + imag(Q(i))*imag(Q(i)) + real(Q(i))*real(Q(i));
end

Vnorma = val;
end