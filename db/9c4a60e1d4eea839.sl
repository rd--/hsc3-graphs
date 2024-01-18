{- Pond life (Jmcc) #1 ; texture=overlap,8,8,4,inf ; requires=kr -}
let f = SinOsc(Rand(20, 50), 0) * Rand(100, 400) + LinRand(500, 2500, 0);
let o = SinOsc(f.kr, 0) * LfPulse(3 / Rand(1, 9), 0, Rand(0.2, 0.5)).kr * 0.04;
EqPan(o, Rand(-1, 1))
