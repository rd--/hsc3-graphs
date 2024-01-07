(* https://github.com/redFrik/udk08-Soft_and_Hard/blob/master/121115soft *)
let tick = Impulse(Phasor(0, 0.001, 4, 40, 0), 0);
let freq = TRand(4000, 5000, tick);
let decay = TRand(0.2, 0.7, tick);
Ringz(tick, freq, decay) * 0.1
