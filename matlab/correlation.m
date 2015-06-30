fs = 10000;
t = 0:1/fs:3;

A = 5;
B = 100;

f = 3;
w = 2 * pi * f;
x = A * sin(w * t);
xn = x + B * (rand(1, length(t)) - 0.5);
xs = x(1:fs);

subplot(2, 1, 1);
plot(xn);

y = xcorr(xs, x);

subplot(2, 1, 2);
plot(y);