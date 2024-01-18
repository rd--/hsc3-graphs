{- Lag -}
let f1 = LinLin(SinOsc(0.05, 0), -1, 1, 220, 440);
let o1 = SinOsc(f1, 0);
let f2 = Lag(f1, 1);
let o2 = SinOsc(f2, 0);
[o1, o2] * 0.1
