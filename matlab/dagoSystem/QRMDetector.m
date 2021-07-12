function [rxData nodos] = QRMDetector(y,H,equ,flag,conste,nstd,QRM,N)
% Signed = 1;
% Word_Length = 16;
% Integer_Part = 5;
% Fractional_Part = Word_Length - Integer_Part;
%
% Data_Format = numerictype('Signed',Signed,'WordLength',Word_Length,'FractionLength',Fractional_Part);
%
% Data_OP = fimath('RoundMode','floor','OverflowMode','saturate',...
%     'ProductMode','SpecifyPrecision',...
%     'ProductWordLength',Word_Length,...
%     'ProductFractionLength',Fractional_Part,...
%     'SumMode','SpecifyPrecision',...
%     'SumWordLength',Word_Length,...
%     'SumFractionLength',Fractional_Part);

% H = fi(H,Data_Format, Data_OP);
% conste = fi(conste,Data_Format, Data_OP);
% nstd = fi(nstd,Data_Format, Data_OP);

[Q R P] = mysortedqr(H,equ,nstd,flag);
yp = Q'*y;
[rxData nodos] = QRMSearch(yp,R,conste,nstd,QRM,P,N);

end