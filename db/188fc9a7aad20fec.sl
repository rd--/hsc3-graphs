{- Saw as an Lfo -}
let lfo = LfSaw(2, 0) * -100 + 600;
SinOsc(lfo, 0) * 0.1
