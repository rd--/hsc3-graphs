(* PmOsc ; carrier and modulator not linked *)
var tr = Impulse(10, 0);
var c = TRand(100, 5000, tr);
var m = TRand(100, 5000, tr);
PmOsc(c, m, 12, 0) * 0.1
