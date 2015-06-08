[samples, fs] = audioread('../Sound/longSoundsWAV/G3Guitar.wav');

for i = 1:length(samples)
    mSamples(i) = (samples(i,1) + samples(i, 2))/2;
end
samples = samples(:, 1);
totalTime = length(samples) / fs;
t = 0 : 1/fs : totalTime - 1/fs;
subplot(2, 1, 1);
plot(t, samples);
subplot(2, 1, 2);
plot(t, mSamples);
