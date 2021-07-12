%{
    Author: Aarón Escoboza Villegas
    Fiile: main.m 
    Description file: Simulate a SISO-V2V system 
%}

clc,clear all;
%% fix point structure 
signed = 1; 
wordLenght = 16;
integerPart = 5; 
fractionalPart = wordLenght - integerPart; 

dataFormat = numerictype('Signed',signed,'WordLength',wordLenght,...
                         'FractionLength',fractionalPart...
                         );

dataFormat2 = fimath('RoundMode','Nearest','OverflowMode','saturate',...
                     'ProductMode','SpecifyPrecision',...
                     'ProductWordLength',wordLenght,...
                     'ProductFractionLength',fractionalPart,...
                     'SumMode','SpecifyPrecision',...
                     'SumWordLength',wordLenght,...
                     'SumFractionLength',fractionalPart...
                     );
%% inital definitions  
minSNR = 9;  
maxSNR = 9;
stepSNR = 3; %increment in SNR 
numOFDMSubCarriers = 64;
numSamplesFFT = 64; 
mmaxSNRError = 20; % max SNR error to simulate
powerTxantenna = 1;
numSubDataCarriers = 48; % subCarriers number per OFDM symbol
QRM = 4; 
M = 4; 
n = log2(M); % bits number per simbol 
equalizationType = 0; % 0 -> zero forcing 1 -> LSMMSE in sorted QR
OFDMSymbols = 5; % symbols number to send per
%% parameters to generate a V2V channel
FFTSize = numOFDMSubCarriers;
sampleRate = 10e6;
maxDopplerShift = 1000; % in Hz 
delayVector = (0:3)*0.1e-6;% for path channel
gainVector = exp(-0.4*(0:3));% avarage path gains(dB)
kFactor = 1;% Linear ratio of spectral power to diffuse power
specDopplerShift = 10;% Doppler shift of spectral component(Hz) 
%% object QAM modulator 
QAMMod = comm.RectangularQAMModulator(M,'BitInput',true,...
                                     'NormalizationMethod','Average power'...
                                      );
%% Constelation
for i = 1:M
    temp = de2bi(i-1,n,'left-msb')';
    conste(i) = step(QAMMod,temp); 
end
conste_fp = fi(conste,dataFormat,dataFormat2);
%% object QAM demodulator 
QAMDemod = comm.RectangularQAMDemodulator(M,'BitOutput',false,...
                                          'NormalizationMethod','Average power'...
                                          );
%% convolutional encoder parameters 
codeRate = 0.5; 
constLen = 7;
codeGenPoly = [171 133]; 
tbLen = 0;
trellis = poly2trellis(constLen,codeGenPoly);
%% convolutional Tx encoder
encoderTx = comm.ConvolutionalEncoder('TerminationMethod','Truncated');
%% Rx decoder 
decoderRx = comm.ViterbiDecoder(poly2trellis(7, [171 133]), ...
                               'InputFormat', 'Hard','TerminationMethod','Truncated'...
                                );
decoderRx.OutputDataType = 'double';
%% Interleaving Tx object 
interleaverTx = comm.MatrixInterleaver(numSubDataCarriers*OFDMSymbols,n);
%% Deinterleaving Rx object
deinterleaverRx = comm.MatrixDeinterleaver(numSubDataCarriers*OFDMSymbols,n);
%% index for data subcarriers,carriers and guards
load('Dindex.mat');
load('Pindex.mat');
load('Gindex.mat');
%% FFT matrices
Fdir = mydftMat(numSubDataCarriers,1);
Finv = mydftMat(numSubDataCarriers,0);
ind=0;
Fdir_fp = fi(Fdir,dataFormat, dataFormat2);
Finv_fp = fi(Finv,dataFormat, dataFormat2);
%% SNR simulation of x symbols
for snr = minSNR:stepSNR:maxSNR 
    %% Initial settings
    BerHard = comm.ErrorRate('ReceiveDelay',tbLen); % objeto para el calculo del BER
    SerHard = comm.ErrorRate('ReceiveDelay',tbLen); % objeto para el calculo del BER
    ind=ind+1;  
    %Gaussian noise
    noise = sqrt( (1 /( 10.^(snr/10 ) ) )/2 ); % se calcula nstd (noise standard deviation) con respecto al SNR promedio por portadora
    noise_fp = fi(noise,dataFormat,dataFormat2);
    %simulation parameters
    errorsFrame = 0; 
    periods = 0; 
    symbols = 0;
    frames = 0;
    oldNumbError = 0;
    contNodos = 0; 
    
    %% Simulation is started
    while(1) 
    %tx bits are generated 
    txData = randi([0 M-1],(numSubDataCarriers/2)*OFDMSymbols,1);
    txBits = reshape((de2bi(txData,n,'left-msb'))',[],1);
    %convolutional encoder for tx data 
    encData = step(encoderTx,txBits);
    %interleaver Tx data
    encData = step(interleaverTx,encData);
    %QAM modulation
    sdata = step(QAMMod,encData); 
    sdata_fp = fi(sdata,dataFormat,dataFormat2); 
    %each simbol is transmitted 
    for k = 1:OFDMSymbols  
        %{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %                                 %
        %        transmitter part         %  
        %                                 %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %}                                
        %OFDM symbol construction 
        sk(GuardIndexes,1) = 0;% guards are inserted
        sk(PilotIndexes,1) = 0;% pilots are inserted
        sk(DataIndexes,1)= Fdir_fp*sdata(1+(k-1)*numSubDataCarriers:numSubDataCarriers+(k-1)*numSubDataCarriers,1); %spreading applied
        sk_fp = fi(sk,dataFormat, dataFormat2);
        %% system noise is added 
        n1_fp = noise_fp * (randn(numSamplesFFT,1)+j*randn(numSamplesFFT,1));
           
        %% V2V matrix channel
        [H,hact] = MultipathFadingChannel(FFTSize,sampleRate, maxDopplerShift, delayVector, gainVector, kFactor, specDopplerShift );
        H_fp = fi(H,dataFormat, dataFormat);
        hact_fp = fi(hact,dataFormat, dataFormat2);
        %% base model
        rec_fp = hact_fp*sk_fp + n1_fp;   
        
        %{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %                                 %
        %        receptor part            %  
        %                                 %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %}         
         %% se extrae la información del vector recibido correspondiente a las portadoras de datos y matriz de canal
         Hm_fp = hact_fp(DataIndexes,DataIndexes);
         rec2_fp(:,1) = rec_fp(DataIndexes);
         %% se aplica el spreading inverso en los vectores de rec y Hm
         recp_fp = Finv*rec2_fp;    
         G_fp = Finv*Hm_fp*Fdir; %matrix with just data 48x48         
         
         
    end
    end
end