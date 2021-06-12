function [H]=nonWSSUSRayleigh(K)
%K=150; %numero de simbolos
Np=64;          %número de portadoras por símbolo
sigma = sqrt(1);    %parámetro del canal
L = 20;             %número de rebotes
T0 = 6.4e-6;        %tiempo entre cada símbolo OFDM
t = linspace(0,T0*(K-1),K);     %vector de tiempo para K símbolos
B = 10e6;           %ancho de banda
f = linspace(-B/2,B/2,Np);  %vector de frecuencias por portadora
fc = 5.9e9;         %frecuencia del canal
fn= length(f);      %tamaño vector de tiempo
tn = length(t);     %tamaño vector de frecuencias
%parámetros del canal en movimiento
% dT = 30;
dR = 30;
D = 500;
C = 3e8;
fmaxT = 250;
fmaxR = 250;
gammaT = 60*pi/180;
gammaR = 120*pi/180;
taunT = zeros(L,tn);
phi_T=zeros(L,tn);
phi_R=zeros(L,tn);
% taunR = zeros(L,length(t));
lambda=C/fc;
k0=(2*pi)/lambda;

gnT = abs(randn(1,L).*sqrt(sigma.^ 2/(2*L))+ 1j*randn(1,L).*sqrt(sigma.^2/(2*L)));
thetanT = rand(1,L)*2*pi;
anR = rand(1,L)*2*pi;
anT = atan(dR*sin(anR)./(D+dR.*cos(anR)));
dT = sqrt(dR^2 + D^2 - 2*dR*D.*cos(pi-anR));
%simular retardos
for k = 1:L
    taunT(k,:) = ( dT(k)+dR )/C - t*( fmaxT*cos(anT(k)-gammaT)+ fmaxR*cos(anR(k)-gammaR) )/fc;
end

%calcular las funciones de transferencia
H = zeros(fn,tn);
for m = 1:fn
    for k = 1:L
        H(m,:) = H(m,:) + gnT(k)*exp( 1j*(2*pi*taunT(k,:)*(fc-f(m)) + thetanT(k) ));
    end
end
