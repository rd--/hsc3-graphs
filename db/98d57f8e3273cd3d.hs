-- three-cpsw (rd, 2006-10-30)
let t = dust kr (mce2 12 18)
    f0 = tRand 1 64 t
    f1 = lfNoise0 kr f0
    a = tRand 0.0 0.5 t
    dt = tRand 0.975 1.025 t
    dh = tRand 0.750 0.7505 t
    f = f1 * mce2 9000 12000 + 9500
    o = saw ar f + saw ar (f * dh) + saw ar (f * dt)
in clip2 (o * a) 0.75 * 0.15
