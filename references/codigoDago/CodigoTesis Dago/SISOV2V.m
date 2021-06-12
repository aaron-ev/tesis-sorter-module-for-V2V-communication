%% Programa para implementar un sistema SISO-OFDM para escenarios V2V
%% se definen parámetros  para simulación
clear all;

%% Estructura de punto fijo
Signed = 'Auto';
Word_Length = 16;   Integer_Part = 5;   Fractional_Part = Word_Length - Integer_Part;
Data_Format = numerictype('Signedness',Signed,'WordLength',Word_Length,'FractionLength',Fractional_Part);
Data_OP = fimath('RoundMode','Nearest','OverflowMode','saturate',...
    'ProductMode','SpecifyPrecision',...
    'ProductWordLength',Word_Length,...
    'ProductFractionLength',Fractional_Part,...
    'SumMode','SpecifyPrecision',...
    'SumWordLength',Word_Length,...
    'SumFractionLength',Fractional_Part);


minSNR = 0; %Inicio de SNR a simular
maxSNR = 12; % Fin de SNR a simular
paso = 3; % incremento en el SNR a simular
ntx = 64; % numero de subportadoras por simbolos OFDM
nrx = 64; % numero de muestras para el calculo de la FFT en la generación de cada simbolo OFDM
errth = 20; % numero m?ximo de errores por SNR a simular
pot1 = 1; % potencia por antena transmisora
num_V2V = 48; % numero de portadoras de datos por cada simbolo V2V
QRM = 4; % numero de sobrevivientes en el esquema NML
M = 4; % M-QAM -> tamaño de la constelación
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
for k=1:M,
    temp = de2bi(k-1,N,'left-msb')';
    conste(k) = step(qamMod,temp);
end
% conste = fi(conste,Data_Format_Conste, Data_OP_Conste);

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
% Fdir = fi(Fdir,Data_Format, Data_OP);
% Finv = fi(Finv,Data_Format, Data_OP);
%%Inicialización de variables a guardar

% recp = fi(0,Data_Format, Data_OP);
% G = fi(0,Data_Format, Data_OP);

% recp2 = [];
% G2 = [];
% Q2 = [];
% H2 = [];
% R2 = [];
% yp2  = [];
% norma2  = [];
% error2 = [];
% dist2  = [];
% dist22  = [];
% dist32 = [];
trama2 = [];
gt2 = [];
ber_Hard2 = [];
ser_Hard2 = [];
errorsframe2 = [];
oldNumError2 = [];
NumErrorHard2 = [];
frames2 = [];
%% genera el  vector SNR
vec_snr = [0 3 5 8 10 12 15 20 25 30];
%% se realiza la simulación para cada SNR de los 1000 simbolos
IdealChannel = 0;
for gt = length(vec_snr):-1:1,
    gt2 = [gt2 gt];
    ebn0 = vec_snr(gt);
    clear IdealChannel;
    switch (gt),
        case 1
            load('SNR0.mat');
        case 2
            load('SNR3.mat');
        case 3
            load('SNR5.mat');
        case 4
            load('SNR8.mat');
        case 5
            load('SNR10.mat');
        case 6
            load('SNR12.mat');
        case 7
            load('SNR15.mat');
        case 8
            load('SNR20.mat');
        case 9
            load('SNR25.mat');
        case 10
            load('SNR30.mat');
    end
    
    tic
    BerHard = comm.ErrorRate('ReceiveDelay',tblen); % objeto para el calculo del BER
    SerHard = comm.ErrorRate('ReceiveDelay',tblen); % objeto para el calculo del BER
    ind=ind+1;
    
    %  nstd is the noise standard deviation
    nstd = sqrt( (1 /( 10.^(ebn0/10 ) ) )/2 ); % se calcula nstd (noise standard deviation) con respecto al SNR promedio por portadora
    %     nstd = fi(nstd,Data_Format, Data_OP);
    % Paramétros de simulación
    errorsframe = 0;
    periods = 0;
    simbolos = 0;
    frames = 0;
    oldNumError=0;
    cont_nodos=0;
    %% ciclo para simulación de cada punto de SNR
    trama = 0;
    while(trama < 10000)
        trama = trama + 1;
        % se genera la cadena de bits de datos
        txData = randi([0 M-1],(num_V2V/2)*symbols,1);
        txBits = reshape((de2bi(txData,N,'left-msb'))',[],1);
        
        % Convolutionally encoder the txData
        encData = step(enc,txBits);
        
        %********* interleaver Data Tx
        encData = step(interleaver,encData);
        
        % QAM modulate
        sdata = step(qamMod,encData);
        %         sdata = fi(sdata,Data_Format, Data_OP);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        for k=1:symbols, % ciclo para la transmisión de los k symbols por frame
            %% Se genera el simbolo OFDM
            sk(GuardIndexes,1) = 0;         % se insertan los simbolos de las bandas de guarda
            sk(PilotIndexes,1) = 0;         % se insertan los simbolos de pilotos
            sk(DataIndexes,1)= Fdir*sdata(1+(k-1)*num_V2V:num_V2V+(k-1)*num_V2V,1); % se aplica el spreading a los datos
            %sk(DataIndexes,1)= sdata(1+(k-1)*num_V2V:num_V2V+(k-1)*num_V2V,1); % se aplica el spreading a los datos
            %             sk = fi(sk,Data_Format, Data_OP);
            %% se completo generación de simbolo OFDM
            
            %% se genera el ruido del sistema
            n1 = nstd * (randn(nrx,1) + j*randn(nrx,1));
            
            %% se genera la matriz de canal V2V
            %             [H,hact] = MultipathFadingChannel(FFTSize,sampleRate, maxDopplerShift, delayVector, gainVector, KFactor, specDopplerShift );
            hact = IdealChannel(:,:,trama);
            %             hact = fi(hact,Data_Format, Data_OP);
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
            
            recp = fi(recp,Data_Format, Data_OP);
%             G = fi(G,Data_Format, Data_OP);
            
            %% se realiza la detección utilizando el metodo QRM adaptable
            equ=1; % 0 -> ZF  1-> MMSE
            flag=1; % 0 -> Unsorted  1 -> Sorted
            %             tic
            [sest  nodos] =   QRMDetector(recp,G,equ,flag,conste,nstd,QRM,N);
            %             toc
            %% se almacena la detección del k-esimo simbolo del bloque
            rxData(1+(k-1)*num_V2V:num_V2V+(k-1)*num_V2V,1)=sest;
            cont_nodos = cont_nodos + nodos;
            %% Guardado de valores
            %             recp2 = [recp2 recp];
            %             G2 = [G2 G];
            %             Q2 = [Q2 Q];
            %             R2 = [R2 R];
            %             yp2  = [yp2 yp];
            %             norma2  = [norma2 norma];
            %             error2 = [error2 error];
            %             dist2  = [dist2 dist];
            %             dist22  = [dist22 dist2];
            %             dist32 = [dist32 dist3];
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
        %         if (errorsframe > errth)
        %             break;
        %         end
%         if (mod(trama,40) == 0)
%             trama2 = [trama2 trama];
%             ber_Hard2 = [ber_Hard2 ber_Hard];
%             ser_Hard2 = [ser_Hard2 ser_Hard];
%             errorsframe2 = [errorsframe2 errorsframe];
%             oldNumError2 = [oldNumError2 oldNumError];
%             NumErrorHard2 = [NumErrorHard2 NumErrorHard];
%             frames2 = [frames2 frames];
%             save('trama.mat','trama2');
%             save('ber_Hard.mat','ber_Hard2');
%             save('ser_Hard.mat','ser_Hard2');
%             save('errorsframe.mat','errorsframe2');
%             save('oldNumError.mat','oldNumError2');
%             save('NumErrorHard.mat','NumErrorHard2');
%             save('frames.mat','frames2');
%             save('gt.mat','gt');
%         end
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
    save('ber.mat','berc');
    toc
end

% save('valorH.mat','H2');
% save('valorQ.mat','Q2');
% save('valorR.mat','R2');
% save('valoryp.mat','yp2');
% save('valornorma.mat','norma2');
% save('valorerror.mat','error2');
% save('valordist.mat','dist2');
% save('valordist2.mat','dist22');
% save('valordist3.mat','dist32');
% save('ValoresBer','berc');

semilogy(SNRdB,berc,'s-')
xlabel('SNR, (dB)');
ylabel('Bit  Error  Rate');
grid on
hold on
