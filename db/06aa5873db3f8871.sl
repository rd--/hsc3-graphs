{- Rlpf -}
let f = SinOsc(XLine(0.7, 300, 20), 0) * 3600 + 4000;
Rlpf(LfSaw(200, 0) * 0.1, f, 0.2)
