R = 10;
C = 1;

t = 0:1/100:10;
h = (1/(R*C)) * exp(-t/(R*C));


fs = 44100;
t1 = 0:1/fs:4;
y1 = 5 * sin(2* 2 * pi * t1') + 10 * (rand(length(t1), 1) - 0.5);

subplot(3, 1, 1);
%plot_fft(y1, fs);
plot(y1);

A = [2, 1, -1, -2, 3];
B = [4, 2, 1, 0.5];

m_conv(A, B);

yf = m_conv(y1', h);

subplot(3, 1, 2);
plot_fft(h, 100);

subplot(3, 1, 3);
%plot_fft(yf, fs);
plot(yf);

player_original = audioplayer(y1, fs);
player_filtered = audioplayer(yf, fs);