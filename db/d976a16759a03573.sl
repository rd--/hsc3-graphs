(* VarSaw ; per-note width modulation *)
var d = LinLin(LfNoise2(0.1), -1, 1, 0.05, 0.5);
var tr = Impulse(1 / d, 0);
var w0 = TRand(0, 0.35, tr);
var w1 = TRand(0.65, 1, tr);
var w = Phasor(tr, (w1 - w0) / SampleRate(), w0, w1, 0);
var o = VarSaw(TRand(36, 72, tr).MidiCps, 0, w) * Decay2(tr, 0.1, d);
EqPan(o, TRand(-1, 1, tr)) / 7
