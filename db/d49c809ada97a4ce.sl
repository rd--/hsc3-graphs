(* Formlet ; noise control *)
var sig = Blip(SinOsc(5, 0) * 20 + 300, 1000) * 0.1;
var frq = LinExp(LfNoise2([0.5, 2.5]), -1, 1, [700, 1300], [2000, 100]);
var dcy = LinExp(LfNoise2([3, 9]), -1, 1, 0.01, 0.2);
Formlet(sig, frq, 0.005, dcy)
