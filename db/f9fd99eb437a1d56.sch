-- three-cpsw (rd, 2006-10-30)
let t = dust [12, 18]
    dt = trand 0.975 1.025 t
    dh = trand 0.750 0.7505 t
    f = lfnoise0 (trand 1 64 t) * [9000, 12000] + 9500
    o = saw f + saw (f * dh) + saw (f * dt)
in clip2 (o * trand 0.0 0.5 t) 0.75 * 0.15
