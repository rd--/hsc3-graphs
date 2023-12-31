(* Choose ; either TChoose or TBufChoose *)
var tr = Impulse(5, 0);
var mnn = Choose(tr, [48 60] +.x [0 2 4 5 7 9 11]);
(SinOsc([48, mnn, 72].MidiCps.Lag(0.1), 0) * [1, 2, 1]).Splay2 / 17
