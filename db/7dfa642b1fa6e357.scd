// Env.adsr ; ar
var tr = Impulse.ar(1, 0);
var gt = Trig.ar(tr, TRand.ar(0.1, 0.2, tr));
var o = Blip.ar(TRand.ar(48, #[60, 72], tr).midicps, TRand.ar(1, 7, tr));
var a = EnvGen.ar(Env.adsr(TRand.ar(0.01, 0.2, tr), TRand.ar(0.3, 0.6, tr), TRand.ar(0.4, 0.6, tr), TRand.ar(0.5, 2, tr), -4), gt, 1, 0, 1, 0);
o * a * 0.1
