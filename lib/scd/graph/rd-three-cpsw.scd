// three cpsw
var t = Dust.kr(#[12, 18]);
var f0 = TRand.kr(1, 64, t);
var f1 = LFNoise0.kr(f0);
var a = TRand.kr(0.0, 0.5, t);
var dt = TRand.kr(0.975, 1.025, t);
var dh = TRand.kr(0.750, 0.7505, t);
var f = f1 * [9000, 12000] + 9500;
var o = Saw.ar(f) + Saw.ar(f * dh) + Saw.ar(f * dt);
(o * a).clip2(0.75)
