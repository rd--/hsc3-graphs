{- Analog bubbles (Jmcc) #1 ; left-to-right -}
let o = LfSaw([8, 7.23], 0).MulAdd(3, 80);
let m = LfSaw(0.4, 0).MulAdd(24, o);
SinOsc(m.MidiCps, 0).Mul(0.04).CombN(0.2, 0.2, 4)
