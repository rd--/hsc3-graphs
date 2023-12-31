(* https://github.com/redFrik/udk08-Soft_and_Hard/blob/master/121115soft *)
var tick = Impulse(Line(3, 60, 10), 0);
var freq = TRand(Line(4000, 100, 10), Line(5000, 8000, 10), tick);
var decay = TRand(0.2, 0.7, tick);
Ringz(tick, freq, decay) * 0.1
