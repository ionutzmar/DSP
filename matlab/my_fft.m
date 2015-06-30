function X = my_fft(x)

    if length(x) == 1
        X = x;
    else
        N = length(x);
        X = [my_fft(x(1 : floor(N / 2))) my_fft(x(floor(N / 2) + 1 : N))];
        for k = 0 : (N / 2) - 1
            t = x(k + 1);
            x(k + 1) = t + exp(-2 * pi * k * 1i / N) * x(k + 1 + floor(N / 2));
            x(k + 1 + floor(N / 2)) = t - exp(-2 * pi * k * 1i / N) * x(k + 1 + floor(N / 2));
        end
    end
end