SynthDef.new(\maracas, {
	arg amp=1, gate=0;
	var env, sig;
	env = EnvGen.kr(Env.new([0.3, 1, 0], [0.027, 0.07], -250), gate, doneAction:2);
	sig = WhiteNoise.ar * env * amp;
	sig = HPF.ar(sig, 5500);
	sig = Pan2.ar(sig, 0);
	Out.ar(0, sig);
}).add;
