{- Zizle (Jmcc) #SC3d1.5 ; texture=overlap,4,4,12,inf -}
let a = { :f | (SinOsc(f * [Rand(0.7, 1.3), 1], { Rand(0, 2 * pi) } ! 2) * 0.1).Sum };
let o = SinOsc(Rand(24, 108).MidiCps, Rand(0, 2 * pi));
let s = o * a(ExpRand(0.3, 8)).Max(0) * a(ExpRand(6, 24)).Abs;
EqPan(s, Rand(-1, 1))
