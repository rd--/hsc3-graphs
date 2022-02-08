SynthDef.new(\MC, {
	arg amp=1, freq=250;
	var sig, fenv, env;
	env = EnvGen.kr(Env.new([0.15, 1, 0], [0, 9], -250),doneAction:2);
	fenv = Env([freq*1.24, freq*1.12, freq], [0.1, 0.5], -4).kr;
	sig = SinOsc.ar(fenv, pi/2);
	sig = Pan2.ar(sig * env * amp * 2, 0);
	Out.ar(0, sig);
}).add;
