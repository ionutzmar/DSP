[samples, fs] = audioread('../Sound/WAV_Long_sounds/C1.wav');
samples = samples(:, 1);
finishTime = length(samples) / fs;
t = 0: 1 / fs : finishTime - 1/fs;
samplesT = length(t);
%%plot(t, samples(1:samplesT));
player = audioplayer(samples, fs);
play(player);


NFFT = 2^nextpow2(samplesT); % Next power of 2 from length of y
Y = fft(samples, NFFT)/samplesT;
f = fs/2*linspace(0,1,NFFT/2+1);

% Plot single-sided amplitude spectrum.
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')