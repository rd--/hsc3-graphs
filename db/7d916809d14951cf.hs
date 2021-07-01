-- three-cpsw (rd, 2006-10-30) ; id
let t = dustId 'α' kr (mce2 12 18)
    f0 = tRandId 'β' 1 64 t
    f1 = lfNoise0Id 'γ' kr f0
    a = tRandId 'δ' 0.0 0.5 t
    dt = tRandId 'ε' 0.975 1.025 t
    dh = tRandId 'ζ' 0.750 0.7505 t
    f = f1 * mce2 9000 12000 + 9500
    o = saw ar f + saw ar (f * dh) + saw ar (f * dt)
in clip2 (o * a) 0.75 * 0.15
