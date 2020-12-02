-- varSaw ; per-note width modulation
let d = linLin (lfNoise2 'α' KR 0.1) (-1) 1 0.05 0.5
    t = impulse AR (1 / d) 0
    w0 = tRand 'β' 0 0.35 t
    w1 = tRand 'γ' 0.65 1 t
    w = phasor AR t ((w1 - w0) * sampleDur) w0 w1 0
    e = decay2 t 0.1 d
    f = midiCPS (tRand 'δ' 36 72 t)
    o = varSaw AR f 0 w * e * 0.1
    l = tRand 'ε' (-1) 1 t
in pan2 o l 1
