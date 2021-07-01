-- pluck
let n = 50
    f = X.rRandNId n 'α' 0.05 0.2
    p = X.rRandNId n 'β' 0 1
    w = mceFill_z 'γ' n (\z _ -> whiteNoiseId z ar)
    fi = X.rRandNId n 'δ' 10 12
    coef = randId 'ε' 0.01 0.2
    l = X.rRandNId n 'ζ' (-1) 1
    x = mouseX kr 60 1000 Exponential 0.1
    o = linLin (sinOsc kr f p) (-1) 1 x 3000
    i = impulse kr fi 0
    ks = pluck (w * 0.1) i 0.01 (1 / o) 2 coef
in leakDC (mix (pan2 ks l 1)) 0.995
