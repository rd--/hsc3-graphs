SynthDef.new(\HT, {
	arg amp, freq=165;
	var sig, fenv, env;
	env = EnvGen.kr(Env.new([0.4, 1, 0], [0, 11], -250),doneAction:2);
	fenv = Env([freq*1.333333, freq*1.121212, freq], [0.1, 0.5], -4).kr;
	sig = SinOsc.ar(fenv, pi/2);
	sig = Pan2.ar(sig * env * amp * 2, 0);
	Out.ar(0, sig);
}).add;
