% Settings
tmax = 3;

% Original signal parameters
A = 1;
fn = 2;
w = 2 * pi * fn;
phase = 0;

% Original signal sampling (simulation of continous function)
fsoriginal = 196000;
toriginal = 1:1/fsoriginal:(tmax + 1);
yoriginal = A * sin(w * toriginal + phase);

% Sampled signal
fs = 8 * fn;
t = 1:1/fs:(tmax + 1);
y = A * sin(w * t + phase);

% Plot
plot(toriginal, yoriginal, t, y); % original continous signal
hold on;
scatter(t, y); % sampled signal
hold on;