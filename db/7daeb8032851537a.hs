-- three-cpsw (rd, 2006-10-30)
let t = dust 'α' KR (mce2 12 18)
    f0 = tRand 'β' 1 64 t
    f1 = lfNoise0 'γ' KR f0
    a = tRand 'δ' 0.0 0.5 t
    dt = tRand 'ε' 0.975 1.025 t
    dh = tRand 'ζ' 0.750 0.7505 t
    f = f1 * mce2 9000 12000 + 9500
    o = saw AR f + saw AR (f * dh) + saw AR (f * dt)
in clip2 (o * a) 0.75 * 0.15
