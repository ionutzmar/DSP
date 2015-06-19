R = 10;
C = 1;

t = 0:1/100:10;
y = (1/(R*C)) * exp(-t/(R*C));


fs = 1/1000;
t1 = 0:fs:4;
y1 = rand(length(t1), 1) - 0.5;

%plot_fft(y1, fs);

yf = conv(y1, y);

plot_fft(yf, fs);