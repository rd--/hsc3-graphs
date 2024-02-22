{- Pwm crossfade (Jl) -}
let n = [400 500 450 376 600];
let d = 1 / 20;
let r = Demand(Impulse(d, [0 0.5]), 0, Dseq(inf, n));
let f = LfPulse(8, 0, LfTri(d, 1).LinLin(-1, 1, 0, 1)).LinLin(0, 1, r[1], r[2]);
Lpf(Saw(f.Max(376) * [1 0.99]) * 0.5, 8000) * 0.2
