[samples, fs] = audioread('../Sound/WAV_Long_sounds/C1.wav');
samples = samples(:, 1);
finishTime = length(samples) / fs;
t = 0: 1 / fs : finishTime - 1/fs;
samplesT = length(t);
subplot(3,1,1);
plot(t, samples(1:samplesT));
player = audioplayer(samples, fs);
play(player);


NFFT = 2^nextpow2(samplesT); % Next power of 2 from length of y
Y = fft(samples, NFFT)/samplesT;
f = fs/2*linspace(0,1,NFFT/2+1);

% Plot single-sided amplitude spectrum.
subplot(3,1,2);
plot(f,2*abs(Y(1:NFFT/2+1)));
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')

magn = 2*abs(Y(1:NFFT/2+1));
[maxM, maxI] = max(magn);
freq = f(maxI);
notesFreq = [32.70, 34.65, 36.71, 38.89, 41.2, 43.65, 46.25, 49, 51.91, 55, 58.27, 61.74, 65.41, 69.30, 73.42, 77.78, 82.41, 87.31, 92.5, 98, 103.83, 110, 116.54, 123.47, 130.81, 138.59, 146.83, 155.56, 164.81, 174.61, 185, 196, 207.69, 220, 233.08, 246.94, 261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392, 415.3, 440, 466.16, 493.88];
notes = {'C1', 'C1#', 'D1', 'D1#', 'E1', 'F1', 'F1#', 'G1' 'G1#', 'A1', 'A1#', 'B1', 'C2', 'C2#', 'D2', 'D2#', 'E2', 'F2', 'F2#', 'G2' 'G2#', 'A2', 'A2#', 'B2', 'C3', 'C3#', 'D3', 'D3#', 'E3', 'F3', 'F3#', 'G3' 'G3#', 'A3', 'A3#', 'B3', 'C4', 'C4#', 'D4', 'D4#', 'E4', 'F4', 'F4#', 'G4' 'G4#', 'A4', 'A4#', 'B4'};
%%plot(notesFreq);
%%semilogy(notesFreq);
notesFreq = log10(notesFreq);
[~, nPoz] = min(abs(notesFreq - log10(freq)));
finalNote = notes(nPoz)
NHarm = 5;
dF = 100;
for i = 2:(NHarm + 1)
    harmPoz = find(f == i * freq);
    magn(harmPoz - dF:harmPoz + dF) = 0;
end

subplot(3, 1, 3);
plot(f,magn);