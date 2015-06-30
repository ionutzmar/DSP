samR = 44000;
a = 34.5;
b = sin(34);


w = 0:1/0.3:samR/2;
H = (a + 1i * w) .* ((a * a + b * b - w .* w + 2 * 1i * a * w).^-1);

fs = samR;
t = 0:1/fs:1;
x = (rand(length(t), 1) - 0.5) * 10;

h = ifft(H);
plot(h);
