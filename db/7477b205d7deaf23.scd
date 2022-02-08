// Env.perc ; ar
var tr = Impulse.ar(1, 0);
var o = Blip.ar(TRand.ar(48, #[60, 72], tr).midicps, TRand.ar(1, 7, tr));
var a = EnvGen.ar(Env.perc(TRand.ar(0.01, 0.2, tr), TRand.ar(0.2, 2, tr), 1, -4), tr, 1, 0, 1, 0);
o * a * 0.1
