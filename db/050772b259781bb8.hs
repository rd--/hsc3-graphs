-- dustRange ; velvet noise (approx.)
let iot = 20 / sampleRate
    x = mouseX kr 1 16 Exponential 0.1
    d = X.dustRangeId 'α' ar (iot / x) (iot * x)
    s = tRandId 'β' (-1) 1 d
in trig d sampleDur * signum s * 0.1
