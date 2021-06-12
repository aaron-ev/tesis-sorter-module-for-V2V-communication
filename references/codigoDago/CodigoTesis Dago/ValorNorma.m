function Vnorma = ValorNorma(Q)

val = imag(Q).*imag(Q) + real(Q).*real(Q);

Vnorma = sum(val);
end