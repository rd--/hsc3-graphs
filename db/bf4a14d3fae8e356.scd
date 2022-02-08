SynthDef.new(\cowbell, {
	arg amp=1;
	var sig, pul1, pul2, env, atk, atkenv, datk;
	atkenv = EnvGen.kr(Env.perc(0, 1, 1, -215),doneAction:0);
	env = EnvGen.kr(Env.perc(0.01, 9.5, 1, -90),doneAction:2);
	pul1 = LFPulse.ar(811.16);
	pul2 = LFPulse.ar(538.75);
	atk = (pul1 + pul2) * atkenv * 6;
	datk = (pul1 + pul2) * env;
	sig = (atk + datk) * amp;
	sig = HPF.ar(sig, 250);
	sig = LPF.ar(sig, 4500);
	sig = Pan2.ar(sig, 0);
	Out.ar(0, sig);
}).add;
