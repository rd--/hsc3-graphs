// rain thunder (jl) ; http://sccode.org/1-e
var n0 = PinkNoise.ar * (0.08 + (LFNoise1.kr(0.3) * 0.02));
var d0 = LPF.ar(Dust2.ar(LFNoise1.kr(0.2).range(40, 50)), 7000);
var e0 = Line.kr(0, 1, 10);
var p0 = (3 * GVerb.ar(HPF.ar(n0 + d0, 400), 250, 100, 0.25, 0.5, 15, 0.3, 0.7, 0.5, 300) * e0).tanh;
var n1 = PinkNoise.ar * (LFNoise1.kr(3).clip(0, 1) * LFNoise1.kr(2).clip(0, 1) ** 1.8);
var f1 = LFNoise1.kr(1).exprange(100, 2500);
var e1 = Line.kr(0, 0.7, 30, 0);
var p1 = GVerb.ar(LPF.ar(10 * HPF.ar(n1,  20), f1).tanh, 270, 30, 0.7, 0.5, 15, 0.5, 0.7, 0.5, 300) * e1;
Limiter.ar(p0 + p1, 1, 0.01) * 0.25
