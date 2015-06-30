Mic = dsp.AudioRecorder;
Speaker = dsp.AudioPlayer;
SpecAnalyzer = dsp.SpectrumAnalyzer;

a = 25;
b = 500;

t = 0:1/1000:3;
h = exp(-a * t) .* cos(b * t);

tic;
while (toc < 30)
    audio = step(Mic);
    audio(1) = conv(audio(1), h, 'same');
    audio(2) = conv(audio(2), h, 'same');
    step(SpecAnalyzer, audio);
    step(Speaker, audio);
end