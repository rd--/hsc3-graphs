-- fmGrainB
let b = control kr "tbl" 10
    t = impulse ar 20 0
    n = linLin (lfNoise1Id 'α' kr 1) (-1) 1 1 10
    s = envSine 9 0.1
    e = envGen kr 1 1 0 1 RemoveSynth s
in X.fmGrainB t 0.2 440 220 n b * e
