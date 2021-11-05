function [W]=mydftMat(N,f)
%Discrete fourier transform
%       x          Column vector of samples
%       f          Mode selector, 1 - Foward transform, 0 - Inverse Transform
%       dftcoef    column Vector of DFT coefficients

W=zeros(N);
for ii=1:N
    for jj=1:N
        W(ii,jj)=exp(-1i*2*pi*(ii-1)*(jj-1)/N);
    end
end
if f==0
    W=W';
end
W=W/sqrt(length(W));