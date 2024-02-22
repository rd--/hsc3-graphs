{- tw 0121 (f0) ; requires=kr -}
let z = SinOsc(1 / [8, 7], 0) * SinOsc(1 / 30, 0) * 9;
let l = 0:7 * 6 + 56;
let m = SinOsc(1 / [4, 3], 0);
let o = SinOsc(Select(z, l).kr.MidiCps, 0) * m;
CombN(o, 1, 1 / [6, 5], 9).Tanh * 0.1
