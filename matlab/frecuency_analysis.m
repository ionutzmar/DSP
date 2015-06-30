[samples, fs] = audioread('../Sound/longSoundsWAV/F4.wav');

samples = samples(:, 1);
% 
% % Add some noise (optional)
% for i = 1:length(samples)
%     samples(i) = samples(i) + (0.5 - rand()) * 0.5;
% end

finishTime = length(samples) / fs;
t = 0: 1 / fs : finishTime - 1/fs;
samplesT = length(t);
%%subplot(3,1,1);
%%plot(t, samples(1:samplesT));
player = audioplayer(samples, fs);
play(player);

NFFT = 2^nextpow2(samplesT); % Next power of 2 from length of y
Y = fft(samples, NFFT)/samplesT;
f = fs/2*linspace(0,1,NFFT/2+1);

% Plot single-sided amplitude spectrum.
%%subplot(3,1,2);
%%plot(f,2*abs(Y(1:NFFT/2+1)));
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')

magn = 2*abs(Y(1:NFFT/2+1));
[maxM, maxI] = max(magn);
freq = f(maxI);

notesFreq = [32.70, 34.65, 36.71, 38.89, 41.2, 43.65, 46.25, 49, 51.91, 55, 58.27, 61.74, 65.41, 69.30, 73.42, 77.78, 82.41, 87.31, 92.5, 98, 103.83, 110, 116.54, 123.47, 130.81, 138.59, 146.83, 155.56, 164.81, 174.61, 185, 196, 207.69, 220, 233.08, 246.94, 261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392, 415.3, 440, 466.16, 493.88];
notes = {'C1', 'C1#', 'D1', 'D1#', 'E1', 'F1', 'F1#', 'G1' 'G1#', 'A1', 'A1#', 'B1', 'C2', 'C2#', 'D2', 'D2#', 'E2', 'F2', 'F2#', 'G2' 'G2#', 'A2', 'A2#', 'B2', 'C3', 'C3#', 'D3', 'D3#', 'E3', 'F3', 'F3#', 'G3' 'G3#', 'A3', 'A3#', 'B3', 'C4', 'C4#', 'D4', 'D4#', 'E4', 'F4', 'F4#', 'G4' 'G4#', 'A4', 'A4#', 'B4'};
%plot(notesFreq);
%semilogy(notesFreq);

notesFreq = [16.35, 17.32, 18.35, 19.45, 20.60, 21.83, 23.12, 24.50, 25.96, 27.50, 29.14, 30.87, 32.70, 34.65, 36.71, 38.89, 41.2, 43.65, 46.25, 49, 51.91, 55, 58.27, 61.74, 65.41, 69.30, 73.42, 77.78, 82.41, 87.31, 92.5, 98, 103.83, 110, 116.54, 123.47, 130.81, 138.59, 146.83, 155.56, 164.81, 174.61, 185, 196, 207.69, 220, 233.08, 246.94, 261.63, 277.18, 293.66, 311.13, 329.63, 349.23, 369.99, 392, 415.3, 440, 466.16, 493.88, 523.25, 554.37, 587.33, 622.25, 659.25, 698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77, 1046.5, 1108.73, 1174.66, 1244.51, 1318.51, 1396.91, 1479.98, 1567.98, 1661.22, 1760.00, 1864.66, 1975.53, 2093.00, 2217.46, 2349.32, 2489.02, 2637.02, 2793.83, 2959.96, 3135.96, 3322.44, 3520.00, 3729.31, 3951.07];
notes = {'C0', 'C0#', 'D0', 'D0#', 'E0', 'F0', 'F0#', 'G0' 'G0#', 'A0', 'A0#', 'B0', 'C1', 'C1#', 'D1', 'D1#', 'E1', 'F1', 'F1#', 'G1', 'G1#', 'A1', 'A1#', 'B1', 'C2', 'C2#', 'D2', 'D2#', 'E2', 'F2', 'F2#', 'G2', 'G2#', 'A2', 'A2#', 'B2', 'C3', 'C3#', 'D3', 'D3#', 'E3', 'F3', 'F3#', 'G3', 'G3#', 'A3', 'A3#', 'B3', 'C4', 'C4#', 'D4', 'D4#', 'E4', 'F4', 'F4#', 'G4', 'G4#', 'A4', 'A4#', 'B4', 'C5', 'C5#', 'D5', 'D5#', 'E5', 'F5', 'F5#', 'G5', 'G5#', 'A5', 'A5#', 'B5', 'C6', 'C6#', 'D6', 'D6#', 'E6', 'F6', 'F6#', 'G6', 'G6#', 'A6', 'A6#', 'B6', 'C7', 'C7#', 'D7', 'D7#', 'E7', 'F7', 'F7#', 'G7', 'G7#', 'A7', 'A7#', 'B7'};
plot(notesFreq);
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

%%subplot(3, 1, 3);
%%plot(f,magn);
