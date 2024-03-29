-- http://sccode.org/1-e (jl)
let d0 = Lpf (Dust2 (LfNoise1 0.2 `toLinRange` (40, 50))) 7000
    n0 = PinkNoise () * (0.08 + LfNoise1 0.3 * 0.02) + d0
    e0 = Line 0 1 10 doNothing
    p0 = Tanh (3 * GVerb (Hpf n0 400) 250 100 0.25 0.5 15 0.3 0.7 0.5 300 * e0)
    lfn f = Clip (LfNoise1 f) 0 1
    n1 = PinkNoise () * ((lfn 3 * lfn 2) ** 1.8)
    f1 = LfNoise1 1 `toExpRange` (100, 2500)
    e1 = Ln 0 0.7 30
    p1 = GVerb (Tanh (Lpf (10 * Hpf n1 20) f1)) 270 30 0.7 0.5 15 0.5 0.7 0.5 300 * e1
in Limiter (p0 + p1) 1 0.01 * 0.2
