SynthDef.new(\cpRaw, {
	arg amp=1, gate=0;
	var atkenv, atk, decay, sum, denv;
	atkenv = EnvGen.kr(Env.new([0.5,1,0],[0, 0.3], -160), doneAction:2);
	denv = EnvGen.kr(Env.dadsr(0.026, 0, 6, 0, 1, 1, curve:-157), doneAction:0);
	atk = WhiteNoise.ar * atkenv * 1.4;
	decay = WhiteNoise.ar * denv;
	sum = atk + decay * amp;
	sum = HPF.ar(sum, 500);
	sum = BPF.ar(sum, 1062, 0.5);
	Out.ar(0, Pan2.ar(sum * 1.5, 0));
}).add;
