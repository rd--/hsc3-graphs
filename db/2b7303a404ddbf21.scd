// 2019-12-01_VICRIMA.scd ; https://github.com/gosub/supercollider-explore
var f = { |x|
	x.ring1(DelayL.ar(PitchShift.ar(x, 0.2, [0.2, 0.21], 0, 0), 1, 0.2))
};
var a = SinOsc.ar(LFNoise0.ar(1).linexp(-1, 1, 100, 1000), 0);
var e = EnvGen.ar(Env.perc(0.01, 1, 1, -4), Dust.ar(8), 1, 0, 1, 0);
f.value(f.value(a * e)).tanh * 0.2
