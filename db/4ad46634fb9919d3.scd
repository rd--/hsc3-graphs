SynthDef.new(\rimshot, {
	arg amp=1;
	var fenv, env, sig, punch, tri1, tri2;
	env = EnvGen.kr(Env.new([1, 1, 0], [0.00272, 0.07], -42), doneAction:2);
	tri1 = LFTri.ar(1667 * 1.1, 1) * env;
	tri2 = LFPulse.ar(455 * 1.1, width:0.8) * env;
	punch = WhiteNoise.ar * env * 0.46;
	sig = tri1 + tri2 + punch;
	sig = BPeakEQ.ar(sig, 464, 0.44, 8);
	sig = HPF.ar(sig, 315);
	sig = LPF.ar(sig, 7300);
	sig = Pan2.ar(sig * amp, 0);
	Out.ar(0, sig);
}).add;
