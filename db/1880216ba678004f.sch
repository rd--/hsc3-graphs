-- 20061030 (rd)
let t = Dust [12, 18]
    dt = TRand 0.975 1.025 t
    dh = TRand 0.750 0.7505 t
    f = LfNoise0 (TRand 1 64 t) * [9000, 12000] + 9500
    o = Saw f + Saw (f * dh) + Saw (f * dt)
in Clip2 (o * TRand 0.0 0.5 t) 0.75 * 0.15
