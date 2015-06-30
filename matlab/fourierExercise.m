fs = 10000;
t = 0 : 1 / fs : 3;
y = (rand(length(t), 1) - 0.5) * 1;

%%plot_fft(y, fs);

samplesT = length(y);
NFFT = 2^nextpow2(samplesT); % Next power of 2 from length of y
Y = fft(y, NFFT)/samplesT;
f = fs/2*linspace(0,1,NFFT/2+1);

a = 25;
b = 500;
h = exp(- a * t) .* cos(b * t);

plot(conv(y, h));
%plot(t, h);
%plot(y);
player = audioplayer(conv(y, h), fs);
play(player);