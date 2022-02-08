SynthDef.new(\HC, {
	arg amp=1, freq=370;
	var sig, fenv, env;
	env = EnvGen.kr(Env.new([0.15, 1, 0], [0, 6], -250),doneAction:2);
	fenv = Env([freq*1.22972, freq*1.08108, freq], [0.1, 0.5], -4).kr;
	sig = SinOsc.ar(fenv, pi/2);
	sig = Pan2.ar(sig * env * amp * 2, 0);
	Out.ar(0, sig);
}).add;
