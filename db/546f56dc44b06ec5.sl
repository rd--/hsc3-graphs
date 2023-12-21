(* TLine *)
var tr = Impulse(1, 0);
var f0 = TRand(220, 330, tr);
var f1 = TRand(110, 440, tr);
var dur = TRand(0.1, 1, tr);
var f = TLine(f0, f1, dur, tr);
var e = Sine(tr, dur) * 0.1;
SinOsc(f, 0) * e
