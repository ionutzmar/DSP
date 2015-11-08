fs = 44100;
t = 0 : 1 / fs : 1;
w1 = sin((2 * pi * 500) * t);
w3 = sin((2 * pi * 508) * t);
w2 = -w1;
plot(t, w1 + w2);


obj = audioplayer(w1, fs);
obj2 = audioplayer(w2, fs);

play(obj);
%play(obj2);

%beats if obj2 or obj1 is mute
obj3 = audioplayer(w3, fs);
play(obj3);