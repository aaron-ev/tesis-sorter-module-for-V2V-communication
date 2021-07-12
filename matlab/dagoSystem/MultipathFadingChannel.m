function [ H, G ] = MultipathFadingChannel(FFTSize,sampleRate, maxDopplerShift, delayVector, gainVector, KFactor, specDopplerShift )

tx = [1:1:FFTSize]';

chan = comm.RayleighChannel('SampleRate', sampleRate, ...
    'PathDelays',          delayVector, ...
    'AveragePathGains',    gainVector, ...
    'MaximumDopplerShift', maxDopplerShift, ...
    'RandomStream',        'mt19937ar with seed', ...
    'Seed',                randi(2000), ...
    'DopplerSpectrum',      doppler('Jakes'),....
    'PathGainsOutputPort', true);


%% system model Loop

[fadedSig  , pathGains] = step(chan,tx); % Apply the channel effects

[a b]=size(pathGains);

%% Channel matrix for time-varying channels

Hmatrix = zeros(FFTSize);
Hmatrix(:,[1:b]) = pathGains;
ChanLength = b;



IdChanindexes = repmat(1:FFTSize,[FFTSize,1]);


for i=1:FFTSize
    IdChanindexes(i,:) = circshift(IdChanindexes(i,:),[0 -ChanLength+i]);
    vec = Hmatrix(i,:);
    Hmatrix2(i,:) = vec(IdChanindexes(i,:));
end

% channel matrix TD
H = Hmatrix2;


% channel matrix FD
F = mydftMat(FFTSize,1);
Finv =mydftMat(FFTSize,0);

G = F*H*Finv;



end

