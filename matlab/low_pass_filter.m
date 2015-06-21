R = 10;
C = 1;

t = 0:1/100:10;
y = (1/(R*C)) * exp(-t/(R*C));


fs = 1/1000;
t1 = 0:fs:4;
y1 = rand(length(t1), 1) - 0.5;

subplot(2, 1, 1);
plot_fft(y1, fs);

A = [2, 1, -1, -2, 3];
B = [4, 2, 1, 0.5];

m_conv(A, B);

yf = m_conv(y1', y);

subplot(2, 1, 2);
plot_fft(yf, fs);