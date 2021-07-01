-- cut-outs (rd, 2006-09-11)
let t = impulse ar 22 0 * (sinOsc kr 0.5 0 + 1)
    x = mouseX kr 0.005 0.12 Exponential 0.1
    y = mouseY kr 0.01 0.52 Exponential 0.1
    n _ = ringz (coinGate (0.05 + lfNoise0 kr 2 + y * 0.4 + t * 0.5) (t * 0.5)) (tExpRand (mce2 500 900) 1600 t) x
    s = mixFill 3 n
    b = tRand 0 1 (dust kr 8)
in mrg [clip2 s (in' 1 kr 0) * 0.25,out 0 b]
