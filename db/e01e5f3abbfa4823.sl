;; zizle (jmcc) #SC3d1.5 ; texture=overlap,4,4,12,inf
var a = { :f | (SinOsc(f * [Rand(0.7, 1.3), 1], { Rand(0, 2 * pi) } ! 2) * 0.1).sum };
var o = SinOsc(Rand(24, 108).MidiCps, Rand(0, 2 * pi));
var s = o * a(ExpRand(0.3, 8)).Max(0) * a(ExpRand(6, 24)).Abs;
Pan2(s, Rand(-1, 1), 1)
