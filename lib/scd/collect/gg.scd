// 2019-11-28_RESINICA.scd ; https://github.com/gosub/supercollider-explore
var note = 60;
var semi = [4, 7, 11, 12];
var delayTimes = (note + ([0] ++ semi)).midicps.reciprocal;
var in = LeakDC.ar(PinkNoise.ar(), 0.995) ! 2 / 5 + SoundIn.ar([0, 1]);
var cf = SinOsc.kr(1 / 10, 0).linlin(-1, 1, 50, 500);
var z = BPF.ar(in, cf, 1);
var cmb = { |x i|
	CombL.ar(x, 0.2, delayTimes[i], 1)
};
var c1 = cmb.value(z[0] + z[1], 0);
var c2 = cmb.value(z[0], 1);
var c3 = cmb.value(z[1], 2);
var c4 = cmb.value(z[0], 3);
var c5 = cmb.value(z[1], 4);
var sumL = (c1 / 2 + c2 + c4) * -10.dbamp;
var sumR = (c1 / 2 + c3 + c5) * -10.dbamp;
Splay.ar([sumL, sumR], 0.5, 1, 0, true)

// 2019-12-01_VICRIMA.scd ; https://github.com/gosub/supercollider-explore
var f = { |x|
	x.ring1(DelayL.ar(PitchShift.ar(x, 0.2, [0.2, 0.21], 0, 0), 1, 0.2))
};
var a = SinOsc.ar(LFNoise0.ar(1).linexp(-1, 1, 100, 1000), 0);
var e = EnvGen.ar(Env.perc(0.01, 1, 1, -4), Dust.ar(8), 1, 0, 1, 0);
f.value(f.value(a * e)).tanh * 0.2
