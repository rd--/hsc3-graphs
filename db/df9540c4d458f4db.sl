{- LfNoise1 -}
let freq = LinLin(LfNoise1(1), -1, 1, 220, 440);
SinOsc(freq, 0) * 0.1
