// spe (jmcc)
var t = Impulse.kr(9, 0);
var s = #[00, 03, 02, 07, 08, 32, 16, 18, 00, 12, 24, 32];
var f = (Demand.kr(t, 0, Dseq.dr(s, inf)) + 32).midicps;
var e = EnvGen.kr(Env.perc(0.01, 1, 1, -4), gate: t, levelScale: 0.1, doneAction: 0);
var z = RLPF.ar(LFSaw.ar(f, 0) * e, (LFNoise1.kr(1) * 36 + 110).midicps, 0.1);
4.do({ z = AllpassN.ar(z, 0.05, { 0.05.rand }.dup, 4) });
z * 0.25
