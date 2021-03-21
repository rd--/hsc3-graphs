-- rDustR ; velvet noise (approx.)
let iot = 20 / sampleRate
    x = mouseX KR 1 16 Exponential 0.1
    d = X.rDustR 'α' AR (iot / x) (iot * x)
    s = tRand 'β' (-1) 1 d
in trig d sampleDur * signum s * 0.1
