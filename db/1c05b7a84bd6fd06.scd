SynthDef.new(\LT, {
	arg amp=1, freq=80;
	var sig, fenv, env, pnoise, penv;
	env = EnvGen.kr(Env.new([0.4, 1, 0], [0, 20], -250),doneAction:2);
	penv = EnvGen.kr(Env.new([0.6, 1, 0], [0, 30], -225),doneAction:2);
	fenv = Env([freq*1.25, freq*1.125, freq], [0.1, 0.5], -4).kr;
	sig = SinOsc.ar(fenv, pi/2) * env;
	sig = Pan2.ar(sig * amp * 3, 0);
	Out.ar(0, sig);
}).add;
