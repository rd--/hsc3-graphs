-- pluck
let n = 50
    f = X.rRandN n 'α' 0.05 0.2
    p = X.rRandN n 'β' 0 1
    w = mceFill_z 'γ' n (\z _ -> whiteNoise z AR)
    fi = X.rRandN n 'δ' 10 12
    coef = rand 'ε' 0.01 0.2
    l = X.rRandN n 'ζ' (-1) 1
    x = mouseX KR 60 1000 Exponential 0.1
    o = linLin (sinOsc KR f p) (-1) 1 x 3000
    i = impulse KR fi 0
    ks = pluck (w * 0.1) i 0.01 (1 / o) 2 coef
in leakDC (mix (pan2 ks l 1)) 0.995
