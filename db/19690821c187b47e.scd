// Env.perc ; kr
var tr = Impulse.kr(1, 0);
var o = Blip.ar(TRand.kr(48, #[60, 72], tr).midicps, TRand.kr(1, 7, tr));
var a = EnvGen.kr(Env.perc(TRand.kr(0.01, 0.2, tr), TRand.kr(0.2, 2, tr), 1, -4), tr, 1, 0, 1, 0);
o * a * 0.1
