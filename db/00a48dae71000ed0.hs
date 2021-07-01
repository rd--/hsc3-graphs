-- varSaw ; per-note width modulation
let d = linLin (lfNoise2Id 'α' kr 0.1) (-1) 1 0.05 0.5
    t = impulse ar (1 / d) 0
    w0 = tRandId 'β' 0 0.35 t
    w1 = tRandId 'γ' 0.65 1 t
    w = phasor ar t ((w1 - w0) * sampleDur) w0 w1 0
    e = decay2 t 0.1 d
    f = midiCPS (tRandId 'δ' 36 72 t)
    o = varSaw ar f 0 w * e * 0.1
    l = tRandId 'ε' (-1) 1 t
in pan2 o l 1
