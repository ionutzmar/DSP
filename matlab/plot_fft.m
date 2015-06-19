function plot_fft(y, fs)
samplesT = length(y);

NFFT = 2^nextpow2(samplesT); % Next power of 2 from length of y
Y = fft(y, NFFT)/samplesT;
f = fs/2*linspace(0,1,NFFT/2+1);

plot(f,2*abs(Y(1:NFFT/2+1)));

end