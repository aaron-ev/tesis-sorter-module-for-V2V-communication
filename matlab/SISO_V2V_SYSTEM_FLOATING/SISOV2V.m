%% Programa para implementar un sistema SISO-OFDM para escenarios V2V
%% se definen parámetros  para simulación
clear all,close all;
global maxValues; 
global minValues;
%% Estructura de punto fijo
Signed = 1;
Word_Length = 16;
Integer_Part = 5;
Fractional_Part = Word_Length - Integer_Part;

Data_Format = numerictype('Signed',Signed,'WordLength',Word_Length,'FractionLength',Fractional_Part);

Data_OP = fimath('RoundMode','Nearest','OverflowMode','saturate',...
    'ProductMode','SpecifyPrecision',...
    'ProductWordLength',Word_Length,...
    'ProductFractionLength',Fractional_Part,...
    'SumMode','SpecifyPrecision',...
    'SumWordLength',Word_Length,...
    'SumFractionLength',Fractional_Part);


minSNR = 9; %Inicio de SNR a simular
maxSNR = 9;%9; % Fin de SNR a simular
paso = 3; % incremento en el SNR a simular
ntx = 64; % numero de subportadoras por simbolos OFDM
nrx = 64; % numero de muestras para el calculo de la FFT en la generación de cada simbolo OFDM
errth = 20; % numero m?ximo de errores por SNR a simular
pot1 = 1; % potencia por antena transmisora
num_V2V = 48; % numero de portadoras de datos por cada simbolo V2V
QRM = 4; % numero de sobrevivientes en el esquema NML
M = 64; % M-QAM -> tamaño de la constelación
N = log2(M); % número de bits enviados por simbolo por portadora de datos
tipo = 0; % usa zero-forcing(tipo=0) o MMSE (tipo=1) en la sorted QR
symbols = 5; % numero de simbolos OFDM por trama enviados

%% Parámetros para generador de canal V2V
FFTSize = ntx;
sampleRate  =  10e6;     % Sample rate of 20K Hz
maxDopplerShift  = 1000;      % Maximum Doppler shift of diffuse components (Hz)
delayVector = (0:3)*.1e-6; % Discrete delays of four-path channel (s)
% delayVector = fi(delayVector,Data_Format, Data_OP); %% este no
gainVector  = exp(-0.4*(0:3));  % Average path gains (dB)
% gainVector = fi(gainVector,Data_Format, Data_OP); %% este no
KFactor = 1;            % Linear ratio of specular power to diffuse power
specDopplerShift = 10;  % Doppler shift of specular component (Hz)

%% Objeto QAM Modulator
qamMod = comm.RectangularQAMModulator(M,'BitInput',true,...
    'NormalizationMethod','Average power');

%% Se genera la constelación para usar en la detección QRM adaptable
for k=1:M
    temp = de2bi(k-1,N,'left-msb')';
    conste(k) = step(qamMod,temp);
end
%%conste = fi(conste,Data_Format, Data_OP);
%% Objeto QAM Demodulator
qamDemod = comm.RectangularQAMDemodulator(M,'BitOutput',false,...
    'NormalizationMethod','Average power');

%% Parámetros para generador de esquema de codifidor convolucional acorde al estandar IEEE V2V
codeRate = 1/2;
constLen = 7;
codeGenPoly = [171 133];
tblen = 0;
trellis = poly2trellis(constLen,codeGenPoly);

%% Objeto para generar Convolutional encoder Tx acorde estandar IEEE V2V
enc = comm.ConvolutionalEncoder('TerminationMethod','Truncated');

%% Objeto para generar Convolutional Decoder Rx  acorde estandar IEEE V2V
decHard = comm.ViterbiDecoder(poly2trellis(7, [171 133]), ...
    'InputFormat', 'Hard','TerminationMethod','Truncated');

% decHard.SoftInputWordLength  = 16;   %%%%%% Estos dos renglones se agregaron para
decHard.OutputDataType = 'double';   %%%%%% Que pudiera funcionar el objeto.

%% Objeto para generar el interleaving en el Tx acorde estandar IEEE V2V
interleaver = comm.MatrixInterleaver(num_V2V*symbols, N);

%% Objeto para generar el deinterleaving en el Rx acorde estandar IEEE V2V
deinterleaver = comm.MatrixDeinterleaver(num_V2V*symbols,N);

%% se cargan los indices para portadoras de  datos, portadoras y guardas acorde estandar IEEE V2V
load('Dindex.mat');
load('Pindex.mat');
load('Gindex.mat');

%% se generan las matrices FFT para ejecución del spreading de los datos en el Tx y Rx
Fdir = mydftMat(num_V2V,1);
Finv = mydftMat(num_V2V,0);
ind=0;
%Fdir = fi(Fdir,Data_Format, Data_OP);
%Finv = fi(Finv,Data_Format, Data_OP);
%% se realiza la simulación para cada SNR de los 1000 simbolos
for i = 1:2

for ebn0 = minSNR:paso:maxSNR,
    tic
    BerHard = comm.ErrorRate('ReceiveDelay',tblen); % objeto para el calculo del BER
    SerHard = comm.ErrorRate('ReceiveDelay',tblen); % objeto para el calculo del BER
    ind = ind + 1;
    
    %  nstd is the noise standard deviation
    nstd = sqrt( (1 /( 10.^(ebn0/10 ) ) )/2 ); % se calcula nstd (noise standard deviation) con respecto al SNR promedio por portadora
    %nstd = fi(nstd,Data_Format, Data_OP);
    % Paramétros de simulación
    errorsframe = 0;
    periods = 0;
    simbolos = 0;
    frames = 0;
    oldNumError=0;
    cont_nodos=0;
    %% ciclo para simulación de cada punto de SNR
    while(1)
        % se genera la cadena de bits de datos
        txData = randi([0 M-1],(num_V2V/2)*symbols,1);
        txBits = reshape((de2bi(txData,N,'left-msb'))',[],1);
        
        % Convolutionally encoder the txData
        encData = step(enc,txBits);
        
        %********* interleaver Data Tx
        encData = step(interleaver,encData);
        
        % QAM modulate
        sdata = step(qamMod,encData);
        %sdata = fi(sdata,Data_Format, Data_OP);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        for k=1:symbols, % ciclo para la transmisión de los k symbols por frame
            %% Se genera el simbolo OFDM
            sk(GuardIndexes,1) = 0;         % se insertan los simbolos de las bandas de guarda
            sk(PilotIndexes,1) = 0;         % se insertan los simbolos de pilotos
            sk(DataIndexes,1)= Fdir*sdata(1+(k-1)*num_V2V:num_V2V+(k-1)*num_V2V,1); % se aplica el spreading a los datos
            %sk(DataIndexes,1)= sdata(1+(k-1)*num_V2V:num_V2V+(k-1)*num_V2V,1); % se aplica el spreading a los datos
            %sk = fi(sk,Data_Format, Data_OP);
            %% se completo generación de simbolo OFDM
            
            %% se genera el ruido del sistema
            n1 = nstd * (randn(nrx,1) + j*randn(nrx,1));
            
            %% se genera la matriz de canal V2V
            [H,hact] = MultipathFadingChannel(FFTSize,sampleRate, maxDopplerShift, delayVector, gainVector, KFactor, specDopplerShift );
            %%H = fi(H,Data_Format, Data_OP);
            %hact = fi(hact,Data_Format, Data_OP);
            %% modelo de banda base
            rec = hact*sk + n1;

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %% empieza  la parte del receptor
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            %% se extrae la información del vector recibido correspondiente a las portadoras de datos y matriz de canal
            Hm=hact(DataIndexes,DataIndexes);
            rec2(:,1) = rec(DataIndexes);
            
            %% se aplica el spreading inverso en los vectores de rec y Hm
            recp = Finv*rec2;           
            G = Finv*Hm*Fdir;
            %% se realiza la detección utilizando el metodo QRM adaptable
            equ=1; % 0 -> ZF  1-> MMSE
            flag=1; % 0 -> Unsorted  1 -> Sorted
            tic
            [sest  nodos] =   QRMDetector(recp,G,equ,flag,conste,nstd,QRM,N);
            %             toc
            %% se almacena la detección del k-esimo simbolo del bloque
            rxData(1+(k-1)*num_V2V:num_V2V+(k-1)*num_V2V,1)=sest;
            cont_nodos = cont_nodos + nodos;
            
        end
        %% se realiza la demodulaci?n de los simbolos estimados y el conteo de errores
        rxBits = reshape((de2bi(rxData,N,'left-msb'))',[],1);
        rxBits = step(deinterleaver,rxBits); % se aplica el proceso de Interleaving inverso en el Rx
        
        %% Hard-decision decoding
        rxBits2 = step(decHard,rxBits); % se aplica el decodificador de canal en el Rx
        berHard = step(BerHard,txBits,rxBits2); % calculan los errores en la recepción
        txData2 = step(qamMod,rxBits2);
        rxData2 = step(qamDemod,txData2);
        serHard = step(SerHard,txData,rxData2); % calculan los errores en la recepción
        
        ber_Hard = berHard(1);
        ser_Hard = serHard(1);
        NumErrorHard = berHard(2);
        
        % se realiza el conteo de errores
        frames = frames + 1;
        
        % se verifican errores en la detección
        if(NumErrorHard ~= oldNumError)
            errorsframe=errorsframe+1;
        end
        oldNumError = NumErrorHard;
        if (errorsframe > errth)
            break;
        end
    end
    fprintf('Simulation results:\n')
    fprintf( '  Eb/N0 = %1.2f\n', ebn0 )
    fprintf( '  Frames = %1.0f\n',frames )
    fprintf( '  Symbols = %1.0f\n', serHard(3))
    fprintf( '  Bits = %1.0f\n', berHard(3))
    fprintf( '  FER = %1.4e\n', errorsframe/frames )
    fprintf( '  SER Hard = %1.4e\n', ser_Hard )
    fprintf( '  BER Hard = %1.4e\n', ber_Hard )
    fprintf( '  Avg Nodes = %1.4e\n', cont_nodos/(frames*symbols*num_V2V) )
    SNRdB(ind)=ebn0;
    berc(ind)=ber_Hard;
    toc
end
end
figure(1);
semilogy(SNRdB,berc,'s-')
xlabel('SNR, (dB)');
ylabel('Bit  Error  Rate');
grid on 
hold on
%%
% Se grafica los valores maximos y minimos 
% con el objetivo de encontrar el mayor y menor rango dinamico
% de las variables del algoritmo del detector. 
fprintf("Maximum values\n");
maxValues
figure(2);
variableNames = categorical({'var1','var2','var3','var4'});
[notUsed indexMaxValue] = max(maxValues);
subplot(1,2,1); 
b_obj = bar(variableNames,maxValues);
b_obj.FaceColor = 'flat';
b_obj.CData(indexMaxValue,:) = [0 1 0];
title("Valores máximos de las variables"); 
fprintf("Minumum values\n");
minValues
variableNames = categorical({'var1','var2','var3'});
[notUsed indexMinValue] = min(minValues); 
subplot(1,2,2); 
b_obj = bar(variableNames,minValues);
b_obj.FaceColor = 'flat';
b_obj.CData(indexMinValue,:) = [0 1 0];
title("Valores mínimos de las variables"); 