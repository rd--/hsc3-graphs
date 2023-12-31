(* https://github.com/redFrik/udk08-Soft_and_Hard/blob/master/121115soft *)
var tick = Impulse(30, 0);
var freq = TRand(400, 4000, tick);
var decay = TRand(0.2, 0.7, tick);
Ringz(tick, freq, decay) * 0.1
