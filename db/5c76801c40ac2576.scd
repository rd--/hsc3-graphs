// Env.adsr ; kr
var tr = Impulse.kr(#[1, 0.75], 0);
var gt = Trig.kr(tr, TRand.kr(0.1, 0.2, tr));
var o = Blip.ar(TRand.kr(48, #[60, 72], tr).midicps, TRand.kr(1, 7, tr));
var a = EnvGen.kr(Env.adsr(TRand.kr(0.01, 0.2, tr), TRand.kr(0.3, 0.6, tr), TRand.kr(0.4, 0.6, tr), TRand.kr(0.5, 2, tr), -4), gt, 1, 0, 1, 0);
o * a * 0.1
