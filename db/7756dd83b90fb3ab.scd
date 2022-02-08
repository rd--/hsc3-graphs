SynthDef.new(\claves, {
	arg amp=1;
	var  env, sig;
	env = EnvGen.kr(Env.new([1, 1, 0], [0, 0.1], -20), doneAction:2);
	sig = SinOsc.ar(2500, pi/2) * env * amp;
	sig = Pan2.ar(sig, 0);
	Out.ar(0, sig);
}).add;
