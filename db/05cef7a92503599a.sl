{- Rlpf -}
let f = SinOsc(0.5, 0) * 40 + 220;
Rlpf(WhiteNoise(), f, 0.1)
