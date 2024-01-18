{- LinExp ; mce -}
let s = [LfSaw(1 / 4, 1), SinOsc(1 / 3, pi / 2)];
SinOsc(LinExp(s + 1, 0, 2, 220, 440), 0) * 0.1
