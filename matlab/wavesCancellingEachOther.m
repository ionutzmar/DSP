%In this example I try to mute a song by playing the same song on the other
%speaker but with opposite values

[samples, fs] = audioread('../Sound/Songs/Coldplay-Paradise.wav');%../Sound/WAV_Long_sounds/AmChordGuitar.wav');
totalTime = length(samples) / fs;
t = 0 : 1/fs : totalTime - 1/fs;
plot(t, samples(:, 1));
yStereo = [-samples(:, 1) samples(:, 1)];
%yStereo = [zeros(length(samples(:, 1)), 1) samples(:, 1)];
sound(yStereo, fs);


%Beat (acoustics) phenomenon:

% fs = 44100;
% t = 0 : 1/fs : 5;
% w1 = sin((2 * pi * 300) * t);
% w2 = sin((2 * pi * 301) * t);
% yStereo = [w2' w1'];
% sound(yStereo, fs);