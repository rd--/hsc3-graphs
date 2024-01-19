{- Tw 0049 (F0) -}
let o0 = LfSaw(3, 0) * 9 + 99;
let s0 = Sweep(0, [3 .. 9]) % o0;
let s1 = (Sweep(0, [31 .. 1] * -1 + 34) % 128).BitAnd(s0);
let o1 = SinOsc((s1 + 33).MidiCps, 0) * pi;
SinOsc(9, o1).Splay / 9
